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
  class Task < GObject::Object
    include AsyncResult

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, completed : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if completed
        (_names.to_unsafe + _n).value = "completed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, completed)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Task.g_type, _n, _names, _values)
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

    def initialize(source_object : GObject::Object?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, callback_data : Pointer(Void)?)
      # g_task_new: (Constructor)
      # @source_object: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @callback_data: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      callback_data = if callback_data.nil?
                        Pointer(Void).null
                      else
                        callback_data.to_unsafe
                      end

      # C call
      _retval = LibGio.g_task_new(source_object, cancellable, callback, callback_data)

      # Return value handling
      @pointer = _retval
    end

    def self.is_valid(result : Gio::AsyncResult, source_object : GObject::Object?) : Bool
      # g_task_is_valid: (None)
      # @source_object: (nullable)
      # Returns: (transfer none)

      # Handle parameters
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

    def self.report_error(source_object : GObject::Object?, callback : Pointer(Void)?, callback_data : Pointer(Void)?, source_tag : Pointer(Void)?, error : GLib::Error) : Nil
      # g_task_report_error: (None)
      # @source_object: (nullable)
      # @callback: (nullable)
      # @callback_data: (nullable)
      # @source_tag: (nullable)
      # @error: (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      callback_data = if callback_data.nil?
                        Pointer(Void).null
                      else
                        callback_data.to_unsafe
                      end
      source_tag = if source_tag.nil?
                     Pointer(Void).null
                   else
                     source_tag.to_unsafe
                   end

      # C call
      LibGio.g_task_report_error(source_object, callback, callback_data, source_tag, error)

      # Return value handling
    end

    def cancellable : Gio::Cancellable
      # g_task_get_cancellable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_get_cancellable(self)

      # Return value handling
      Gio::Cancellable.new(_retval, GICrystal::Transfer::None)
    end

    def check_cancellable : Bool
      # g_task_get_check_cancellable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_get_check_cancellable(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def completed : Bool
      # g_task_get_completed: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_get_completed(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def context : GLib::MainContext
      # g_task_get_context: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_get_context(self)

      # Return value handling
      GLib::MainContext.new(_retval, GICrystal::Transfer::None)
    end

    def name : ::String?
      # g_task_get_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_get_name(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def priority : Int32
      # g_task_get_priority: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_get_priority(self)

      # Return value handling
      _retval
    end

    def return_on_cancel : Bool
      # g_task_get_return_on_cancel: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_get_return_on_cancel(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def source_object : GObject::Object?
      # g_task_get_source_object: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_get_source_object(self)

      # Return value handling
      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def source_tag : Pointer(Void)?
      # g_task_get_source_tag: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_get_source_tag(self)

      # Return value handling
      _retval unless _retval.null?
    end

    def task_data : Pointer(Void)?
      # g_task_get_task_data: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_get_task_data(self)

      # Return value handling
      _retval unless _retval.null?
    end

    def had_error : Bool
      # g_task_had_error: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_had_error(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def propagate_boolean : Bool
      # g_task_propagate_boolean: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_task_propagate_boolean(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def propagate_int : Int64
      # g_task_propagate_int: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_task_propagate_int(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def propagate_pointer : Pointer(Void)?
      # g_task_propagate_pointer: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_task_propagate_pointer(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval unless _retval.null?
    end

    def propagate_value : GObject::Value
      # g_task_propagate_value: (Method | Throws)
      # @value: (out) (caller-allocates)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      value = GObject::Value.new

      # C call
      _retval = LibGio.g_task_propagate_value(self, value, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      value
    end

    def return_boolean(result : Bool) : Nil
      # g_task_return_boolean: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_task_return_boolean(self, result)

      # Return value handling
    end

    def return_error(error : GLib::Error) : Nil
      # g_task_return_error: (Method)
      # @error: (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_task_return_error(self, error)

      # Return value handling
    end

    def return_error_if_cancelled : Bool
      # g_task_return_error_if_cancelled: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_return_error_if_cancelled(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def return_int(result : Int64) : Nil
      # g_task_return_int: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_task_return_int(self, result)

      # Return value handling
    end

    def return_pointer(result : Pointer(Void)?, result_destroy : Pointer(Void)?) : Nil
      # g_task_return_pointer: (Method)
      # @result: (transfer full) (nullable)
      # @result_destroy: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      result = if result.nil?
                 Pointer(Void).null
               else
                 result.to_unsafe
               end
      result_destroy = if result_destroy.nil?
                         LibGLib::DestroyNotify.null
                       else
                         result_destroy.to_unsafe
                       end

      # C call
      LibGio.g_task_return_pointer(self, result, result_destroy)

      # Return value handling
    end

    def return_value(result : _?) : Nil
      # g_task_return_value: (Method)
      # @result: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      result = if result.nil?
                 Pointer(Void).null
               else
                 result.to_unsafe
               end
      result = GObject::Value.new(result) unless result.is_a?(GObject::Value)

      # C call
      LibGio.g_task_return_value(self, result)

      # Return value handling
    end

    def run_in_thread(task_func : Pointer(Void)) : Nil
      # g_task_run_in_thread: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_task_run_in_thread(self, task_func)

      # Return value handling
    end

    def run_in_thread_sync(task_func : Pointer(Void)) : Nil
      # g_task_run_in_thread_sync: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_task_run_in_thread_sync(self, task_func)

      # Return value handling
    end

    def check_cancellable=(check_cancellable : Bool) : Nil
      # g_task_set_check_cancellable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_task_set_check_cancellable(self, check_cancellable)

      # Return value handling
    end

    def name=(name : ::String?) : Nil
      # g_task_set_name: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibGio.g_task_set_name(self, name)

      # Return value handling
    end

    def priority=(priority : Int32) : Nil
      # g_task_set_priority: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_task_set_priority(self, priority)

      # Return value handling
    end

    def return_on_cancel=(return_on_cancel : Bool) : Bool
      # g_task_set_return_on_cancel: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_task_set_return_on_cancel(self, return_on_cancel)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def source_tag=(source_tag : Pointer(Void)?) : Nil
      # g_task_set_source_tag: (Method)
      # @source_tag: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      source_tag = if source_tag.nil?
                     Pointer(Void).null
                   else
                     source_tag.to_unsafe
                   end

      # C call
      LibGio.g_task_set_source_tag(self, source_tag)

      # Return value handling
    end

    def set_task_data(task_data : Pointer(Void)?, task_data_destroy : Pointer(Void)?) : Nil
      # g_task_set_task_data: (Method)
      # @task_data: (nullable)
      # @task_data_destroy: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      task_data = if task_data.nil?
                    Pointer(Void).null
                  else
                    task_data.to_unsafe
                  end
      task_data_destroy = if task_data_destroy.nil?
                            LibGLib::DestroyNotify.null
                          else
                            task_data_destroy.to_unsafe
                          end

      # C call
      LibGio.g_task_set_task_data(self, task_data, task_data_destroy)

      # Return value handling
    end
  end
end
