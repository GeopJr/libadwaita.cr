require "../g_object-2.0/object"
require "./async_result"

module Gio
  # A #GTask represents and manages a cancellable "task".
  #
  # ## Asynchronous operations
  #
  # The most common usage of #GTask is as a #GAsyncResult, to
  # manage data during an asynchronous operation. You call
  # g_task_new() in the "start" method, followed by
  # g_task_set_task_data() and the like if you need to keep some
  # additional data associated with the task, and then pass the
  # task object around through your asynchronous operation.
  # Eventually, you will call a method such as
  # g_task_return_pointer() or g_task_return_error(), which will
  # save the value you give it and then invoke the task's callback
  # function in the
  # [thread-default main context][g-main-context-push-thread-default]
  # where it was created (waiting until the next iteration of the main
  # loop first, if necessary). The caller will pass the #GTask back to
  # the operation's finish function (as a #GAsyncResult), and you can
  # use g_task_propagate_pointer() or the like to extract the
  # return value.
  #
  # Using #GTask requires the thread-default #GMainContext from when the
  # #GTask was constructed to be running at least until the task has completed
  # and its data has been freed.
  #
  # Here is an example for using GTask as a GAsyncResult:
  # |[<!-- language="C" -->
  #     typedef struct {
  #       CakeFrostingType frosting;
  #       char *message;
  #     } DecorationData;
  #
  #     static void
  #     decoration_data_free (DecorationData *decoration)
  #     {
  #       g_free (decoration->message);
  #       g_slice_free (DecorationData, decoration);
  #     }
  #
  #     static void
  #     baked_cb (Cake     *cake,
  #               gpointer  user_data)
  #     {
  #       GTask *task = user_data;
  #       DecorationData *decoration = g_task_get_task_data (task);
  #       GError *error = NULL;
  #
  #       if (cake == NULL)
  #         {
  #           g_task_return_new_error (task, BAKER_ERROR, BAKER_ERROR_NO_FLOUR,
  #                                    "Go to the supermarket");
  #           g_object_unref (task);
  #           return;
  #         }
  #
  #       if (!cake_decorate (cake, decoration->frosting, decoration->message, &error))
  #         {
  #           g_object_unref (cake);
  #           // g_task_return_error() takes ownership of error
  #           g_task_return_error (task, error);
  #           g_object_unref (task);
  #           return;
  #         }
  #
  #       g_task_return_pointer (task, cake, g_object_unref);
  #       g_object_unref (task);
  #     }
  #
  #     void
  #     baker_bake_cake_async (Baker               *self,
  #                            guint                radius,
  #                            CakeFlavor           flavor,
  #                            CakeFrostingType     frosting,
  #                            const char          *message,
  #                            GCancellable        *cancellable,
  #                            GAsyncReadyCallback  callback,
  #                            gpointer             user_data)
  #     {
  #       GTask *task;
  #       DecorationData *decoration;
  #       Cake  *cake;
  #
  #       task = g_task_new (self, cancellable, callback, user_data);
  #       if (radius < 3)
  #         {
  #           g_task_return_new_error (task, BAKER_ERROR, BAKER_ERROR_TOO_SMALL,
  #                                    "%ucm radius cakes are silly",
  #                                    radius);
  #           g_object_unref (task);
  #           return;
  #         }
  #
  #       cake = _baker_get_cached_cake (self, radius, flavor, frosting, message);
  #       if (cake != NULL)
  #         {
  #           // _baker_get_cached_cake() returns a reffed cake
  #           g_task_return_pointer (task, cake, g_object_unref);
  #           g_object_unref (task);
  #           return;
  #         }
  #
  #       decoration = g_slice_new (DecorationData);
  #       decoration->frosting = frosting;
  #       decoration->message = g_strdup (message);
  #       g_task_set_task_data (task, decoration, (GDestroyNotify) decoration_data_free);
  #
  #       _baker_begin_cake (self, radius, flavor, cancellable, baked_cb, task);
  #     }
  #
  #     Cake *
  #     baker_bake_cake_finish (Baker         *self,
  #                             GAsyncResult  *result,
  #                             GError       **error)
  #     {
  #       g_return_val_if_fail (g_task_is_valid (result, self), NULL);
  #
  #       return g_task_propagate_pointer (G_TASK (result), error);
  #     }
  # ]|
  #
  # ## Chained asynchronous operations
  #
  # #GTask also tries to simplify asynchronous operations that
  # internally chain together several smaller asynchronous
  # operations. g_task_get_cancellable(), g_task_get_context(),
  # and g_task_get_priority() allow you to get back the task's
  # #GCancellable, #GMainContext, and [I/O priority][io-priority]
  # when starting a new subtask, so you don't have to keep track
  # of them yourself. g_task_attach_source() simplifies the case
  # of waiting for a source to fire (automatically using the correct
  # #GMainContext and priority).
  #
  # Here is an example for chained asynchronous operations:
  #   |[<!-- language="C" -->
  #     typedef struct {
  #       Cake *cake;
  #       CakeFrostingType frosting;
  #       char *message;
  #     } BakingData;
  #
  #     static void
  #     decoration_data_free (BakingData *bd)
  #     {
  #       if (bd->cake)
  #         g_object_unref (bd->cake);
  #       g_free (bd->message);
  #       g_slice_free (BakingData, bd);
  #     }
  #
  #     static void
  #     decorated_cb (Cake         *cake,
  #                   GAsyncResult *result,
  #                   gpointer      user_data)
  #     {
  #       GTask *task = user_data;
  #       GError *error = NULL;
  #
  #       if (!cake_decorate_finish (cake, result, &error))
  #         {
  #           g_object_unref (cake);
  #           g_task_return_error (task, error);
  #           g_object_unref (task);
  #           return;
  #         }
  #
  #       // baking_data_free() will drop its ref on the cake, so we have to
  #       // take another here to give to the caller.
  #       g_task_return_pointer (task, g_object_ref (cake), g_object_unref);
  #       g_object_unref (task);
  #     }
  #
  #     static gboolean
  #     decorator_ready (gpointer user_data)
  #     {
  #       GTask *task = user_data;
  #       BakingData *bd = g_task_get_task_data (task);
  #
  #       cake_decorate_async (bd->cake, bd->frosting, bd->message,
  #                            g_task_get_cancellable (task),
  #                            decorated_cb, task);
  #
  #       return G_SOURCE_REMOVE;
  #     }
  #
  #     static void
  #     baked_cb (Cake     *cake,
  #               gpointer  user_data)
  #     {
  #       GTask *task = user_data;
  #       BakingData *bd = g_task_get_task_data (task);
  #       GError *error = NULL;
  #
  #       if (cake == NULL)
  #         {
  #           g_task_return_new_error (task, BAKER_ERROR, BAKER_ERROR_NO_FLOUR,
  #                                    "Go to the supermarket");
  #           g_object_unref (task);
  #           return;
  #         }
  #
  #       bd->cake = cake;
  #
  #       // Bail out now if the user has already cancelled
  #       if (g_task_return_error_if_cancelled (task))
  #         {
  #           g_object_unref (task);
  #           return;
  #         }
  #
  #       if (cake_decorator_available (cake))
  #         decorator_ready (task);
  #       else
  #         {
  #           GSource *source;
  #
  #           source = cake_decorator_wait_source_new (cake);
  #           // Attach @source to @task's GMainContext and have it call
  #           // decorator_ready() when it is ready.
  #           g_task_attach_source (task, source, decorator_ready);
  #           g_source_unref (source);
  #         }
  #     }
  #
  #     void
  #     baker_bake_cake_async (Baker               *self,
  #                            guint                radius,
  #                            CakeFlavor           flavor,
  #                            CakeFrostingType     frosting,
  #                            const char          *message,
  #                            gint                 priority,
  #                            GCancellable        *cancellable,
  #                            GAsyncReadyCallback  callback,
  #                            gpointer             user_data)
  #     {
  #       GTask *task;
  #       BakingData *bd;
  #
  #       task = g_task_new (self, cancellable, callback, user_data);
  #       g_task_set_priority (task, priority);
  #
  #       bd = g_slice_new0 (BakingData);
  #       bd->frosting = frosting;
  #       bd->message = g_strdup (message);
  #       g_task_set_task_data (task, bd, (GDestroyNotify) baking_data_free);
  #
  #       _baker_begin_cake (self, radius, flavor, cancellable, baked_cb, task);
  #     }
  #
  #     Cake *
  #     baker_bake_cake_finish (Baker         *self,
  #                             GAsyncResult  *result,
  #                             GError       **error)
  #     {
  #       g_return_val_if_fail (g_task_is_valid (result, self), NULL);
  #
  #       return g_task_propagate_pointer (G_TASK (result), error);
  #     }
  # ]|
  #
  # ## Asynchronous operations from synchronous ones
  #
  # You can use g_task_run_in_thread() to turn a synchronous
  # operation into an asynchronous one, by running it in a thread.
  # When it completes, the result will be dispatched to the
  # [thread-default main context][g-main-context-push-thread-default]
  # where the #GTask was created.
  #
  # Running a task in a thread:
  #   |[<!-- language="C" -->
  #     typedef struct {
  #       guint radius;
  #       CakeFlavor flavor;
  #       CakeFrostingType frosting;
  #       char *message;
  #     } CakeData;
  #
  #     static void
  #     cake_data_free (CakeData *cake_data)
  #     {
  #       g_free (cake_data->message);
  #       g_slice_free (CakeData, cake_data);
  #     }
  #
  #     static void
  #     bake_cake_thread (GTask         *task,
  #                       gpointer       source_object,
  #                       gpointer       task_data,
  #                       GCancellable  *cancellable)
  #     {
  #       Baker *self = source_object;
  #       CakeData *cake_data = task_data;
  #       Cake *cake;
  #       GError *error = NULL;
  #
  #       cake = bake_cake (baker, cake_data->radius, cake_data->flavor,
  #                         cake_data->frosting, cake_data->message,
  #                         cancellable, &error);
  #       if (cake)
  #         g_task_return_pointer (task, cake, g_object_unref);
  #       else
  #         g_task_return_error (task, error);
  #     }
  #
  #     void
  #     baker_bake_cake_async (Baker               *self,
  #                            guint                radius,
  #                            CakeFlavor           flavor,
  #                            CakeFrostingType     frosting,
  #                            const char          *message,
  #                            GCancellable        *cancellable,
  #                            GAsyncReadyCallback  callback,
  #                            gpointer             user_data)
  #     {
  #       CakeData *cake_data;
  #       GTask *task;
  #
  #       cake_data = g_slice_new (CakeData);
  #       cake_data->radius = radius;
  #       cake_data->flavor = flavor;
  #       cake_data->frosting = frosting;
  #       cake_data->message = g_strdup (message);
  #       task = g_task_new (self, cancellable, callback, user_data);
  #       g_task_set_task_data (task, cake_data, (GDestroyNotify) cake_data_free);
  #       g_task_run_in_thread (task, bake_cake_thread);
  #       g_object_unref (task);
  #     }
  #
  #     Cake *
  #     baker_bake_cake_finish (Baker         *self,
  #                             GAsyncResult  *result,
  #                             GError       **error)
  #     {
  #       g_return_val_if_fail (g_task_is_valid (result, self), NULL);
  #
  #       return g_task_propagate_pointer (G_TASK (result), error);
  #     }
  # ]|
  #
  # ## Adding cancellability to uncancellable tasks
  #
  # Finally, g_task_run_in_thread() and g_task_run_in_thread_sync()
  # can be used to turn an uncancellable operation into a
  # cancellable one. If you call g_task_set_return_on_cancel(),
  # passing %TRUE, then if the task's #GCancellable is cancelled,
  # it will return control back to the caller immediately, while
  # allowing the task thread to continue running in the background
  # (and simply discarding its result when it finally does finish).
  # Provided that the task thread is careful about how it uses
  # locks and other externally-visible resources, this allows you
  # to make "GLib-friendly" asynchronous and cancellable
  # synchronous variants of blocking APIs.
  #
  # Cancelling a task:
  #   |[<!-- language="C" -->
  #     static void
  #     bake_cake_thread (GTask         *task,
  #                       gpointer       source_object,
  #                       gpointer       task_data,
  #                       GCancellable  *cancellable)
  #     {
  #       Baker *self = source_object;
  #       CakeData *cake_data = task_data;
  #       Cake *cake;
  #       GError *error = NULL;
  #
  #       cake = bake_cake (baker, cake_data->radius, cake_data->flavor,
  #                         cake_data->frosting, cake_data->message,
  #                         &error);
  #       if (error)
  #         {
  #           g_task_return_error (task, error);
  #           return;
  #         }
  #
  #       // If the task has already been cancelled, then we don't want to add
  #       // the cake to the cake cache. Likewise, we don't  want to have the
  #       // task get cancelled in the middle of updating the cache.
  #       // g_task_set_return_on_cancel() will return %TRUE here if it managed
  #       // to disable return-on-cancel, or %FALSE if the task was cancelled
  #       // before it could.
  #       if (g_task_set_return_on_cancel (task, FALSE))
  #         {
  #           // If the caller cancels at this point, their
  #           // GAsyncReadyCallback won't be invoked until we return,
  #           // so we don't have to worry that this code will run at
  #           // the same time as that code does. But if there were
  #           // other functions that might look at the cake cache,
  #           // then we'd probably need a GMutex here as well.
  #           baker_add_cake_to_cache (baker, cake);
  #           g_task_return_pointer (task, cake, g_object_unref);
  #         }
  #     }
  #
  #     void
  #     baker_bake_cake_async (Baker               *self,
  #                            guint                radius,
  #                            CakeFlavor           flavor,
  #                            CakeFrostingType     frosting,
  #                            const char          *message,
  #                            GCancellable        *cancellable,
  #                            GAsyncReadyCallback  callback,
  #                            gpointer             user_data)
  #     {
  #       CakeData *cake_data;
  #       GTask *task;
  #
  #       cake_data = g_slice_new (CakeData);
  #
  #       ...
  #
  #       task = g_task_new (self, cancellable, callback, user_data);
  #       g_task_set_task_data (task, cake_data, (GDestroyNotify) cake_data_free);
  #       g_task_set_return_on_cancel (task, TRUE);
  #       g_task_run_in_thread (task, bake_cake_thread);
  #     }
  #
  #     Cake *
  #     baker_bake_cake_sync (Baker               *self,
  #                           guint                radius,
  #                           CakeFlavor           flavor,
  #                           CakeFrostingType     frosting,
  #                           const char          *message,
  #                           GCancellable        *cancellable,
  #                           GError             **error)
  #     {
  #       CakeData *cake_data;
  #       GTask *task;
  #       Cake *cake;
  #
  #       cake_data = g_slice_new (CakeData);
  #
  #       ...
  #
  #       task = g_task_new (self, cancellable, NULL, NULL);
  #       g_task_set_task_data (task, cake_data, (GDestroyNotify) cake_data_free);
  #       g_task_set_return_on_cancel (task, TRUE);
  #       g_task_run_in_thread_sync (task, bake_cake_thread);
  #
  #       cake = g_task_propagate_pointer (task, error);
  #       g_object_unref (task);
  #       return cake;
  #     }
  # ]|
  #
  # ## Porting from GSimpleAsyncResult
  #
  # #GTask's API attempts to be simpler than #GSimpleAsyncResult's
  # in several ways:
  # - You can save task-specific data with g_task_set_task_data(), and
  #   retrieve it later with g_task_get_task_data(). This replaces the
  #   abuse of g_simple_async_result_set_op_res_gpointer() for the same
  #   purpose with #GSimpleAsyncResult.
  # - In addition to the task data, #GTask also keeps track of the
  #   [priority][io-priority], #GCancellable, and
  #   #GMainContext associated with the task, so tasks that consist of
  #   a chain of simpler asynchronous operations will have easy access
  #   to those values when starting each sub-task.
  # - g_task_return_error_if_cancelled() provides simplified
  #   handling for cancellation. In addition, cancellation
  #   overrides any other #GTask return value by default, like
  #   #GSimpleAsyncResult does when
  #   g_simple_async_result_set_check_cancellable() is called.
  #   (You can use g_task_set_check_cancellable() to turn off that
  #   behavior.) On the other hand, g_task_run_in_thread()
  #   guarantees that it will always run your
  #   `task_func`, even if the task's #GCancellable
  #   is already cancelled before the task gets a chance to run;
  #   you can start your `task_func` with a
  #   g_task_return_error_if_cancelled() check if you need the
  #   old behavior.
  # - The "return" methods (eg, g_task_return_pointer())
  #   automatically cause the task to be "completed" as well, and
  #   there is no need to worry about the "complete" vs "complete
  #   in idle" distinction. (#GTask automatically figures out
  #   whether the task's callback can be invoked directly, or
  #   if it needs to be sent to another #GMainContext, or delayed
  #   until the next iteration of the current #GMainContext.)
  # - The "finish" functions for #GTask based operations are generally
  #   much simpler than #GSimpleAsyncResult ones, normally consisting
  #   of only a single call to g_task_propagate_pointer() or the like.
  #   Since g_task_propagate_pointer() "steals" the return value from
  #   the #GTask, it is not necessary to juggle pointers around to
  #   prevent it from being freed twice.
  # - With #GSimpleAsyncResult, it was common to call
  #   g_simple_async_result_propagate_error() from the
  #   `_finish()` wrapper function, and have
  #   virtual method implementations only deal with successful
  #   returns. This behavior is deprecated, because it makes it
  #   difficult for a subclass to chain to a parent class's async
  #   methods. Instead, the wrapper function should just be a
  #   simple wrapper, and the virtual method should call an
  #   appropriate `g_task_propagate_` function.
  #   Note that wrapper methods can now use
  #   g_async_result_legacy_propagate_error() to do old-style
  #   #GSimpleAsyncResult error-returning behavior, and
  #   g_async_result_is_tagged() to check if a result is tagged as
  #   having come from the `_async()` wrapper
  #   function (for "short-circuit" results, such as when passing
  #   0 to g_input_stream_read_async()).
  @[GObject::GeneratedWrapper]
  class Task < GObject::Object
    include AsyncResult

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::TaskClass), class_init,
        sizeof(LibGio::Task), instance_init, 0)
    end

    GICrystal.define_new_method(Task, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Task`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, completed : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !completed.nil?
        (_names.to_unsafe + _n).value = "completed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, completed)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Task.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_task_get_type
    end

    def completed? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "completed", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a #GTask acting on @source_object, which will eventually be
    # used to invoke @callback in the current
    # [thread-default main context][g-main-context-push-thread-default].
    #
    # Call this in the "start" method of your asynchronous method, and
    # pass the #GTask around throughout the asynchronous operation. You
    # can use g_task_set_task_data() to attach task-specific data to the
    # object, which you can retrieve later via g_task_get_task_data().
    #
    # By default, if @cancellable is cancelled, then the return value of
    # the task will always be %G_IO_ERROR_CANCELLED, even if the task had
    # already completed before the cancellation. This allows for
    # simplified handling in cases where cancellation may imply that
    # other objects that the task depends on have been destroyed. If you
    # do not want this behavior, you can use
    # g_task_set_check_cancellable() to change it.
    def self.new(source_object : GObject::Object?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, callback_data : Pointer(Void)?) : self
      # g_task_new: (Constructor)
      # @source_object: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @callback_data: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      callback_data = if callback_data.nil?
                        Pointer(Void).null
                      else
                        callback_data.to_unsafe
                      end

      # C call
      _retval = LibGio.g_task_new(source_object, cancellable, callback, callback_data)

      # Return value handling

      Gio::Task.new(_retval, GICrystal::Transfer::Full)
    end

    # Checks that @result is a #GTask, and that @source_object is its
    # source object (or that @source_object is %NULL and @result has no
    # source object). This can be used in g_return_if_fail() checks.
    def self.is_valid(result : Gio::AsyncResult, source_object : GObject::Object?) : Bool
      # g_task_is_valid: (None)
      # @source_object: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end

      # C call
      _retval = LibGio.g_task_is_valid(result, source_object)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Creates a #GTask and then immediately calls g_task_return_error()
    # on it. Use this in the wrapper function of an asynchronous method
    # when you want to avoid even calling the virtual method. You can
    # then use g_async_result_is_tagged() in the finish method wrapper to
    # check if the result there is tagged as having been created by the
    # wrapper method, and deal with it appropriately if so.
    #
    # See also g_task_report_new_error().
    def self.report_error(source_object : GObject::Object?, callback : Gio::AsyncReadyCallback?, callback_data : Pointer(Void)?, source_tag : Pointer(Void)?, error : GLib::Error) : Nil
      # g_task_report_error: (None)
      # @source_object: (nullable)
      # @callback: (nullable)
      # @callback_data: (nullable)
      # @source_tag: (nullable)
      # @error: (transfer full)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end
      # Generator::NullableArrayPlan
      callback_data = if callback_data.nil?
                        Pointer(Void).null
                      else
                        callback_data.to_unsafe
                      end
      # Generator::NullableArrayPlan
      source_tag = if source_tag.nil?
                     Pointer(Void).null
                   else
                     source_tag.to_unsafe
                   end

      # C call
      LibGio.g_task_report_error(source_object, callback, callback_data, source_tag, error)

      # Return value handling
    end

    # Gets @task's #GCancellable
    def cancellable : Gio::Cancellable
      # g_task_get_cancellable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_get_cancellable(@pointer)

      # Return value handling

      Gio::Cancellable.new(_retval, GICrystal::Transfer::None)
    end

    # Gets @task's check-cancellable flag. See
    # g_task_set_check_cancellable() for more details.
    def check_cancellable : Bool
      # g_task_get_check_cancellable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_get_check_cancellable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value of #GTask:completed. This changes from %FALSE to %TRUE after
    # the task’s callback is invoked, and will return %FALSE if called from inside
    # the callback.
    def completed : Bool
      # g_task_get_completed: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_get_completed(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the #GMainContext that @task will return its result in (that
    # is, the context that was the
    # [thread-default main context][g-main-context-push-thread-default]
    # at the point when @task was created).
    #
    # This will always return a non-%NULL value, even if the task's
    # context is the default #GMainContext.
    def context : GLib::MainContext
      # g_task_get_context: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_get_context(@pointer)

      # Return value handling

      GLib::MainContext.new(_retval, GICrystal::Transfer::None)
    end

    # Gets @task’s name. See g_task_set_name().
    def name : ::String?
      # g_task_get_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_get_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets @task's priority
    def priority : Int32
      # g_task_get_priority: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_get_priority(@pointer)

      # Return value handling

      _retval
    end

    # Gets @task's return-on-cancel flag. See
    # g_task_set_return_on_cancel() for more details.
    def return_on_cancel : Bool
      # g_task_get_return_on_cancel: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_get_return_on_cancel(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the source object from @task. Like
    # g_async_result_get_source_object(), but does not ref the object.
    def source_object : GObject::Object?
      # g_task_get_source_object: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_get_source_object(@pointer)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets @task's source tag. See g_task_set_source_tag().
    def source_tag : Pointer(Void)?
      # g_task_get_source_tag: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_get_source_tag(@pointer)

      # Return value handling

      _retval unless _retval.null?
    end

    # Gets @task's `task_data`.
    def task_data : Pointer(Void)?
      # g_task_get_task_data: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_get_task_data(@pointer)

      # Return value handling

      _retval unless _retval.null?
    end

    # Tests if @task resulted in an error.
    def had_error : Bool
      # g_task_had_error: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_had_error(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the result of @task as a #gboolean.
    #
    # If the task resulted in an error, or was cancelled, then this will
    # instead return %FALSE and set @error.
    #
    # Since this method transfers ownership of the return value (or
    # error) to the caller, you may only call it once.
    def propagate_boolean : Bool
      # g_task_propagate_boolean: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_task_propagate_boolean(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the result of @task as an integer (#gssize).
    #
    # If the task resulted in an error, or was cancelled, then this will
    # instead return -1 and set @error.
    #
    # Since this method transfers ownership of the return value (or
    # error) to the caller, you may only call it once.
    def propagate_int : Int64
      # g_task_propagate_int: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_task_propagate_int(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Gets the result of @task as a pointer, and transfers ownership
    # of that value to the caller.
    #
    # If the task resulted in an error, or was cancelled, then this will
    # instead return %NULL and set @error.
    #
    # Since this method transfers ownership of the return value (or
    # error) to the caller, you may only call it once.
    def propagate_pointer : Pointer(Void)?
      # g_task_propagate_pointer: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_task_propagate_pointer(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval unless _retval.null?
    end

    # Gets the result of @task as a #GValue, and transfers ownership of
    # that value to the caller. As with g_task_return_value(), this is
    # a generic low-level method; g_task_propagate_pointer() and the like
    # will usually be more useful for C code.
    #
    # If the task resulted in an error, or was cancelled, then this will
    # instead set @error and return %FALSE.
    #
    # Since this method transfers ownership of the return value (or
    # error) to the caller, you may only call it once.
    def propagate_value : GObject::Value
      # g_task_propagate_value: (Method | Throws)
      # @value: (out) (caller-allocates)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::CallerAllocatesPlan
      value = GObject::Value.new
      # C call
      _retval = LibGio.g_task_propagate_value(@pointer, value, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      value
    end

    # Sets @task's result to @result and completes the task (see
    # g_task_return_pointer() for more discussion of exactly what this
    # means).
    def return_boolean(result : Bool) : Nil
      # g_task_return_boolean: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_task_return_boolean(@pointer, result)

      # Return value handling
    end

    # Sets @task's result to @error (which @task assumes ownership of)
    # and completes the task (see g_task_return_pointer() for more
    # discussion of exactly what this means).
    #
    # Note that since the task takes ownership of @error, and since the
    # task may be completed before returning from g_task_return_error(),
    # you cannot assume that @error is still valid after calling this.
    # Call g_error_copy() on the error if you need to keep a local copy
    # as well.
    #
    # See also g_task_return_new_error().
    def return_error(error : GLib::Error) : Nil
      # g_task_return_error: (Method)
      # @error: (transfer full)
      # Returns: (transfer none)

      # C call
      LibGio.g_task_return_error(@pointer, error)

      # Return value handling
    end

    # Checks if @task's #GCancellable has been cancelled, and if so, sets
    # @task's error accordingly and completes the task (see
    # g_task_return_pointer() for more discussion of exactly what this
    # means).
    def return_error_if_cancelled : Bool
      # g_task_return_error_if_cancelled: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_return_error_if_cancelled(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets @task's result to @result and completes the task (see
    # g_task_return_pointer() for more discussion of exactly what this
    # means).
    def return_int(result : Int64) : Nil
      # g_task_return_int: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_task_return_int(@pointer, result)

      # Return value handling
    end

    # Sets @task's result to @result and completes the task. If @result
    # is not %NULL, then @result_destroy will be used to free @result if
    # the caller does not take ownership of it with
    # g_task_propagate_pointer().
    #
    # "Completes the task" means that for an ordinary asynchronous task
    # it will either invoke the task's callback, or else queue that
    # callback to be invoked in the proper #GMainContext, or in the next
    # iteration of the current #GMainContext. For a task run via
    # g_task_run_in_thread() or g_task_run_in_thread_sync(), calling this
    # method will save @result to be returned to the caller later, but
    # the task will not actually be completed until the #GTaskThreadFunc
    # exits.
    #
    # Note that since the task may be completed before returning from
    # g_task_return_pointer(), you cannot assume that @result is still
    # valid after calling this, unless you are still holding another
    # reference on it.
    def return_pointer(result : Pointer(Void)?, result_destroy : GLib::DestroyNotify?) : Nil
      # g_task_return_pointer: (Method)
      # @result: (transfer full) (nullable)
      # @result_destroy: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      result = if result.nil?
                 Pointer(Void).null
               else
                 result.to_unsafe
               end

      # C call
      LibGio.g_task_return_pointer(@pointer, result, result_destroy)

      # Return value handling
    end

    # Sets @task's result to @result (by copying it) and completes the task.
    #
    # If @result is %NULL then a #GValue of type %G_TYPE_POINTER
    # with a value of %NULL will be used for the result.
    #
    # This is a very generic low-level method intended primarily for use
    # by language bindings; for C code, g_task_return_pointer() and the
    # like will normally be much easier to use.
    def return_value(result : _?) : Nil
      # g_task_return_value: (Method)
      # @result: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      result = if result.nil?
                 Pointer(Void).null
               elsif !result.is_a?(GObject::Value)
                 GObject::Value.new(result).to_unsafe
               else
                 result.to_unsafe
               end

      # C call
      LibGio.g_task_return_value(@pointer, result)

      # Return value handling
    end

    # Runs @task_func in another thread. When @task_func returns, @task's
    # #GAsyncReadyCallback will be invoked in @task's #GMainContext.
    #
    # This takes a ref on @task until the task completes.
    #
    # See #GTaskThreadFunc for more details about how @task_func is handled.
    #
    # Although GLib currently rate-limits the tasks queued via
    # g_task_run_in_thread(), you should not assume that it will always
    # do this. If you have a very large number of tasks to run (several tens of
    # tasks), but don't want them to all run at once, you should only queue a
    # limited number of them (around ten) at a time.
    def run_in_thread(task_func : Gio::TaskThreadFunc) : Nil
      # g_task_run_in_thread: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_task_run_in_thread(@pointer, task_func)

      # Return value handling
    end

    # Runs @task_func in another thread, and waits for it to return or be
    # cancelled. You can use g_task_propagate_pointer(), etc, afterward
    # to get the result of @task_func.
    #
    # See #GTaskThreadFunc for more details about how @task_func is handled.
    #
    # Normally this is used with tasks created with a %NULL
    # `callback`, but note that even if the task does
    # have a callback, it will not be invoked when @task_func returns.
    # #GTask:completed will be set to %TRUE just before this function returns.
    #
    # Although GLib currently rate-limits the tasks queued via
    # g_task_run_in_thread_sync(), you should not assume that it will
    # always do this. If you have a very large number of tasks to run,
    # but don't want them to all run at once, you should only queue a
    # limited number of them at a time.
    def run_in_thread_sync(task_func : Gio::TaskThreadFunc) : Nil
      # g_task_run_in_thread_sync: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_task_run_in_thread_sync(@pointer, task_func)

      # Return value handling
    end

    # Sets or clears @task's check-cancellable flag. If this is %TRUE
    # (the default), then g_task_propagate_pointer(), etc, and
    # g_task_had_error() will check the task's #GCancellable first, and
    # if it has been cancelled, then they will consider the task to have
    # returned an "Operation was cancelled" error
    # (%G_IO_ERROR_CANCELLED), regardless of any other error or return
    # value the task may have had.
    #
    # If @check_cancellable is %FALSE, then the #GTask will not check the
    # cancellable itself, and it is up to @task's owner to do this (eg,
    # via g_task_return_error_if_cancelled()).
    #
    # If you are using g_task_set_return_on_cancel() as well, then
    # you must leave check-cancellable set %TRUE.
    def check_cancellable=(check_cancellable : Bool) : Nil
      # g_task_set_check_cancellable: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_task_set_check_cancellable(@pointer, check_cancellable)

      # Return value handling
    end

    # Sets @task’s name, used in debugging and profiling. The name defaults to
    # %NULL.
    #
    # The task name should describe in a human readable way what the task does.
    # For example, ‘Open file’ or ‘Connect to network host’. It is used to set the
    # name of the #GSource used for idle completion of the task.
    #
    # This function may only be called before the @task is first used in a thread
    # other than the one it was constructed in. It is called automatically by
    # g_task_set_source_tag() if not called already.
    def name=(name : ::String?) : Nil
      # g_task_set_name: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibGio.g_task_set_name(@pointer, name)

      # Return value handling
    end

    # Sets @task's priority. If you do not call this, it will default to
    # %G_PRIORITY_DEFAULT.
    #
    # This will affect the priority of #GSources created with
    # g_task_attach_source() and the scheduling of tasks run in threads,
    # and can also be explicitly retrieved later via
    # g_task_get_priority().
    def priority=(priority : Int32) : Nil
      # g_task_set_priority: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_task_set_priority(@pointer, priority)

      # Return value handling
    end

    # Sets or clears @task's return-on-cancel flag. This is only
    # meaningful for tasks run via g_task_run_in_thread() or
    # g_task_run_in_thread_sync().
    #
    # If @return_on_cancel is %TRUE, then cancelling @task's
    # #GCancellable will immediately cause it to return, as though the
    # task's #GTaskThreadFunc had called
    # g_task_return_error_if_cancelled() and then returned.
    #
    # This allows you to create a cancellable wrapper around an
    # uninterruptible function. The #GTaskThreadFunc just needs to be
    # careful that it does not modify any externally-visible state after
    # it has been cancelled. To do that, the thread should call
    # g_task_set_return_on_cancel() again to (atomically) set
    # return-on-cancel %FALSE before making externally-visible changes;
    # if the task gets cancelled before the return-on-cancel flag could
    # be changed, g_task_set_return_on_cancel() will indicate this by
    # returning %FALSE.
    #
    # You can disable and re-enable this flag multiple times if you wish.
    # If the task's #GCancellable is cancelled while return-on-cancel is
    # %FALSE, then calling g_task_set_return_on_cancel() to set it %TRUE
    # again will cause the task to be cancelled at that point.
    #
    # If the task's #GCancellable is already cancelled before you call
    # g_task_run_in_thread()/g_task_run_in_thread_sync(), then the
    # #GTaskThreadFunc will still be run (for consistency), but the task
    # will also be completed right away.
    def return_on_cancel=(return_on_cancel : Bool) : Bool
      # g_task_set_return_on_cancel: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_task_set_return_on_cancel(@pointer, return_on_cancel)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets @task's source tag.
    #
    # You can use this to tag a task return
    # value with a particular pointer (usually a pointer to the function
    # doing the tagging) and then later check it using
    # g_task_get_source_tag() (or g_async_result_is_tagged()) in the
    # task's "finish" function, to figure out if the response came from a
    # particular place.
    #
    # A macro wrapper around this function will automatically set the
    # task’s name to the string form of @source_tag if it’s not already
    # set, for convenience.
    def source_tag=(source_tag : Pointer(Void)?) : Nil
      # g_task_set_source_tag: (Method)
      # @source_tag: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      source_tag = if source_tag.nil?
                     Pointer(Void).null
                   else
                     source_tag.to_unsafe
                   end

      # C call
      LibGio.g_task_set_source_tag(@pointer, source_tag)

      # Return value handling
    end

    # Sets @task's task data (freeing the existing task data, if any).
    def set_task_data(task_data : Pointer(Void)?, task_data_destroy : GLib::DestroyNotify?) : Nil
      # g_task_set_task_data: (Method)
      # @task_data: (nullable)
      # @task_data_destroy: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      task_data = if task_data.nil?
                    Pointer(Void).null
                  else
                    task_data.to_unsafe
                  end

      # C call
      LibGio.g_task_set_task_data(@pointer, task_data, task_data_destroy)

      # Return value handling
    end
  end
end
