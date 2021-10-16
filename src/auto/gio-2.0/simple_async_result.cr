require "../g_object-2.0/object"
require "./async_result"

module Gio
  # As of GLib 2.46, #GSimpleAsyncResult is deprecated in favor of
  # #GTask, which provides a simpler API.
  #
  # #GSimpleAsyncResult implements #GAsyncResult.
  #
  # GSimpleAsyncResult handles #GAsyncReadyCallbacks, error
  # reporting, operation cancellation and the final state of an operation,
  # completely transparent to the application. Results can be returned
  # as a pointer e.g. for functions that return data that is collected
  # asynchronously, a boolean value for checking the success or failure
  # of an operation, or a #gssize for operations which return the number
  # of bytes modified by the operation; all of the simple return cases
  # are covered.
  #
  # Most of the time, an application will not need to know of the details
  # of this API; it is handled transparently, and any necessary operations
  # are handled by #GAsyncResult's interface. However, if implementing a
  # new GIO module, for writing language bindings, or for complex
  # applications that need better control of how asynchronous operations
  # are completed, it is important to understand this functionality.
  #
  # GSimpleAsyncResults are tagged with the calling function to ensure
  # that asynchronous functions and their finishing functions are used
  # together correctly.
  #
  # To create a new #GSimpleAsyncResult, call g_simple_async_result_new().
  # If the result needs to be created for a #GError, use
  # g_simple_async_result_new_from_error() or
  # g_simple_async_result_new_take_error(). If a #GError is not available
  # (e.g. the asynchronous operation's doesn't take a #GError argument),
  # but the result still needs to be created for an error condition, use
  # g_simple_async_result_new_error() (or g_simple_async_result_set_error_va()
  # if your application or binding requires passing a variable argument list
  # directly), and the error can then be propagated through the use of
  # g_simple_async_result_propagate_error().
  #
  # An asynchronous operation can be made to ignore a cancellation event by
  # calling g_simple_async_result_set_handle_cancellation() with a
  # #GSimpleAsyncResult for the operation and %FALSE. This is useful for
  # operations that are dangerous to cancel, such as close (which would
  # cause a leak if cancelled before being run).
  #
  # GSimpleAsyncResult can integrate into GLib's event loop, #GMainLoop,
  # or it can use #GThreads.
  # g_simple_async_result_complete() will finish an I/O task directly
  # from the point where it is called. g_simple_async_result_complete_in_idle()
  # will finish it from an idle handler in the
  # [thread-default main context][g-main-context-push-thread-default]
  # where the #GSimpleAsyncResult was created.
  # g_simple_async_result_run_in_thread() will run the job in a
  # separate thread and then use
  # g_simple_async_result_complete_in_idle() to deliver the result.
  #
  # To set the results of an asynchronous function,
  # g_simple_async_result_set_op_res_gpointer(),
  # g_simple_async_result_set_op_res_gboolean(), and
  # g_simple_async_result_set_op_res_gssize()
  # are provided, setting the operation's result to a gpointer, gboolean, or
  # gssize, respectively.
  #
  # Likewise, to get the result of an asynchronous function,
  # g_simple_async_result_get_op_res_gpointer(),
  # g_simple_async_result_get_op_res_gboolean(), and
  # g_simple_async_result_get_op_res_gssize() are
  # provided, getting the operation's result as a gpointer, gboolean, and
  # gssize, respectively.
  #
  # For the details of the requirements implementations must respect, see
  # #GAsyncResult.  A typical implementation of an asynchronous operation
  # using GSimpleAsyncResult looks something like this:
  #
  # |[<!-- language="C" -->
  # static void
  # baked_cb (Cake    *cake,
  #           gpointer user_data)
  # {
  #   // In this example, this callback is not given a reference to the cake,
  #   // so the GSimpleAsyncResult has to take a reference to it.
  #   GSimpleAsyncResult *result = user_data;
  #
  #   if (cake == NULL)
  #     g_simple_async_result_set_error (result,
  #                                      BAKER_ERRORS,
  #                                      BAKER_ERROR_NO_FLOUR,
  #                                      "Go to the supermarket");
  #   else
  #     g_simple_async_result_set_op_res_gpointer (result,
  #                                                g_object_ref (cake),
  #                                                g_object_unref);
  #
  #
  #   // In this example, we assume that baked_cb is called as a callback from
  #   // the mainloop, so it's safe to complete the operation synchronously here.
  #   // If, however, _baker_prepare_cake () might call its callback without
  #   // first returning to the mainloop — inadvisable, but some APIs do so —
  #   // we would need to use g_simple_async_result_complete_in_idle().
  #   g_simple_async_result_complete (result);
  #   g_object_unref (result);
  # }
  #
  # void
  # baker_bake_cake_async (Baker              *self,
  #                        guint               radius,
  #                        GAsyncReadyCallback callback,
  #                        gpointer            user_data)
  # {
  #   GSimpleAsyncResult *simple;
  #   Cake               *cake;
  #
  #   if (radius < 3)
  #     {
  #       g_simple_async_report_error_in_idle (G_OBJECT (self),
  #                                            callback,
  #                                            user_data,
  #                                            BAKER_ERRORS,
  #                                            BAKER_ERROR_TOO_SMALL,
  #                                            "%ucm radius cakes are silly",
  #                                            radius);
  #       return;
  #     }
  #
  #   simple = g_simple_async_result_new (G_OBJECT (self),
  #                                       callback,
  #                                       user_data,
  #                                       baker_bake_cake_async);
  #   cake = _baker_get_cached_cake (self, radius);
  #
  #   if (cake != NULL)
  #     {
  #       g_simple_async_result_set_op_res_gpointer (simple,
  #                                                  g_object_ref (cake),
  #                                                  g_object_unref);
  #       g_simple_async_result_complete_in_idle (simple);
  #       g_object_unref (simple);
  #       // Drop the reference returned by _baker_get_cached_cake();
  #       // the GSimpleAsyncResult has taken its own reference.
  #       g_object_unref (cake);
  #       return;
  #     }
  #
  #   _baker_prepare_cake (self, radius, baked_cb, simple);
  # }
  #
  # Cake *
  # baker_bake_cake_finish (Baker        *self,
  #                         GAsyncResult *result,
  #                         GError      **error)
  # {
  #   GSimpleAsyncResult *simple;
  #   Cake               *cake;
  #
  #   g_return_val_if_fail (g_simple_async_result_is_valid (result,
  #                                                         G_OBJECT (self),
  #                                                         baker_bake_cake_async),
  #                         NULL);
  #
  #   simple = (GSimpleAsyncResult *) result;
  #
  #   if (g_simple_async_result_propagate_error (simple, error))
  #     return NULL;
  #
  #   cake = CAKE (g_simple_async_result_get_op_res_gpointer (simple));
  #   return g_object_ref (cake);
  # }
  # ]|
  class SimpleAsyncResult < GObject::Object
    include AsyncResult

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_simple_async_result_get_type
    end

    def initialize(source_object : GObject::Object?, callback : Pointer(Void)?, user_data : Pointer(Nil)?, source_tag : Pointer(Nil)?)
      # g_simple_async_result_new: (Constructor)
      # @source_object: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # @source_tag: (nullable)
      # Returns: (transfer full)

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
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      source_tag = if source_tag.nil?
                     Pointer(Void).null
                   else
                     source_tag.to_unsafe
                   end

      _retval = LibGio.g_simple_async_result_new(source_object, callback, user_data, source_tag)
      @pointer = _retval
    end

    def self.new_from_error(source_object : GObject::Object?, callback : Pointer(Void)?, user_data : Pointer(Nil)?, error : GLib::Error) : Gio::SimpleAsyncResult
      # g_simple_async_result_new_from_error: (Constructor)
      # @source_object: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer full)

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
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      _retval = LibGio.g_simple_async_result_new_from_error(source_object, callback, user_data, error)
      Gio::SimpleAsyncResult.new(_retval, GICrystal::Transfer::Full)
    end

    def self.is_valid(result : Gio::AsyncResult, source : GObject::Object?, source_tag : Pointer(Nil)?) : Bool
      # g_simple_async_result_is_valid: (None)
      # @source: (nullable)
      # @source_tag: (nullable)
      # Returns: (transfer none)

      source = if source.nil?
                 Pointer(Void).null
               else
                 source.to_unsafe
               end
      source_tag = if source_tag.nil?
                     Pointer(Void).null
                   else
                     source_tag.to_unsafe
                   end

      _retval = LibGio.g_simple_async_result_is_valid(result, source, source_tag)
      GICrystal.to_bool(_retval)
    end

    def complete : Nil
      # g_simple_async_result_complete: (Method)
      # Returns: (transfer none)

      LibGio.g_simple_async_result_complete(self)
    end

    def complete_in_idle : Nil
      # g_simple_async_result_complete_in_idle: (Method)
      # Returns: (transfer none)

      LibGio.g_simple_async_result_complete_in_idle(self)
    end

    def op_res_gboolean : Bool
      # g_simple_async_result_get_op_res_gboolean: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_simple_async_result_get_op_res_gboolean(self)
      GICrystal.to_bool(_retval)
    end

    def op_res_gssize : Int64
      # g_simple_async_result_get_op_res_gssize: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_simple_async_result_get_op_res_gssize(self)
      _retval
    end

    def propagate_error : Bool
      # g_simple_async_result_propagate_error: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_simple_async_result_propagate_error(self)
      GICrystal.to_bool(_retval)
    end

    def check_cancellable=(check_cancellable : Gio::Cancellable?) : Nil
      # g_simple_async_result_set_check_cancellable: (Method)
      # @check_cancellable: (nullable)
      # Returns: (transfer none)

      check_cancellable = if check_cancellable.nil?
                            Pointer(Void).null
                          else
                            check_cancellable.to_unsafe
                          end

      LibGio.g_simple_async_result_set_check_cancellable(self, check_cancellable)
    end

    def from_error=(error : GLib::Error) : Nil
      # g_simple_async_result_set_from_error: (Method)
      # Returns: (transfer none)

      LibGio.g_simple_async_result_set_from_error(self, error)
    end

    def handle_cancellation=(handle_cancellation : Bool) : Nil
      # g_simple_async_result_set_handle_cancellation: (Method)
      # Returns: (transfer none)

      LibGio.g_simple_async_result_set_handle_cancellation(self, handle_cancellation)
    end

    def op_res_gboolean=(op_res : Bool) : Nil
      # g_simple_async_result_set_op_res_gboolean: (Method)
      # Returns: (transfer none)

      LibGio.g_simple_async_result_set_op_res_gboolean(self, op_res)
    end

    def op_res_gssize=(op_res : Int64) : Nil
      # g_simple_async_result_set_op_res_gssize: (Method)
      # Returns: (transfer none)

      LibGio.g_simple_async_result_set_op_res_gssize(self, op_res)
    end
  end
end
