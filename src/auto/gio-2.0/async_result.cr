module Gio
  # Provides a base class for implementing asynchronous function results.
  #
  # Asynchronous operations are broken up into two separate operations
  # which are chained together by a #GAsyncReadyCallback. To begin
  # an asynchronous operation, provide a #GAsyncReadyCallback to the
  # asynchronous function. This callback will be triggered when the
  # operation has completed, and must be run in a later iteration of
  # the [thread-default main context][g-main-context-push-thread-default]
  # from where the operation was initiated. It will be passed a
  # #GAsyncResult instance filled with the details of the operation's
  # success or failure, the object the asynchronous function was
  # started for and any error codes returned. The asynchronous callback
  # function is then expected to call the corresponding "_finish()"
  # function, passing the object the function was called for, the
  # #GAsyncResult instance, and (optionally) an @error to grab any
  # error conditions that may have occurred.
  #
  # The "_finish()" function for an operation takes the generic result
  # (of type #GAsyncResult) and returns the specific result that the
  # operation in question yields (e.g. a #GFileEnumerator for a
  # "enumerate children" operation). If the result or error status of the
  # operation is not needed, there is no need to call the "_finish()"
  # function; GIO will take care of cleaning up the result and error
  # information after the #GAsyncReadyCallback returns. You can pass
  # %NULL for the #GAsyncReadyCallback if you don't need to take any
  # action at all after the operation completes. Applications may also
  # take a reference to the #GAsyncResult and call "_finish()" later;
  # however, the "_finish()" function may be called at most once.
  #
  # Example of a typical asynchronous operation flow:
  # |[<!-- language="C" -->
  # void _theoretical_frobnitz_async (Theoretical         *t,
  #                                   GCancellable        *c,
  #                                   GAsyncReadyCallback  cb,
  #                                   gpointer             u);
  #
  # gboolean _theoretical_frobnitz_finish (Theoretical   *t,
  #                                        GAsyncResult  *res,
  #                                        GError       **e);
  #
  # static void
  # frobnitz_result_func (GObject      *source_object,
  # 		 GAsyncResult *res,
  # 		 gpointer      user_data)
  # {
  #   gboolean success = FALSE;
  #
  #   success = _theoretical_frobnitz_finish (source_object, res, NULL);
  #
  #   if (success)
  #     g_printf ("Hurray!\n");
  #   else
  #     g_printf ("Uh oh!\n");
  #
  #   ...
  #
  # }
  #
  # int main (int argc, void *argv[])
  # {
  #    ...
  #
  #    _theoretical_frobnitz_async (theoretical_data,
  #                                 NULL,
  #                                 frobnitz_result_func,
  #                                 NULL);
  #
  #    ...
  # }
  # ]|
  #
  # The callback for an asynchronous operation is called only once, and is
  # always called, even in the case of a cancelled operation. On cancellation
  # the result is a %G_IO_ERROR_CANCELLED error.
  #
  # ## I/O Priority # {#io-priority}
  #
  # Many I/O-related asynchronous operations have a priority parameter,
  # which is used in certain cases to determine the order in which
  # operations are executed. They are not used to determine system-wide
  # I/O scheduling. Priorities are integers, with lower numbers indicating
  # higher priority. It is recommended to choose priorities between
  # %G_PRIORITY_LOW and %G_PRIORITY_HIGH, with %G_PRIORITY_DEFAULT
  # as a default.
  module AsyncResult
    def source_object : GObject::Object?
      # g_async_result_get_source_object: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_async_result_get_source_object(self)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def user_data : Pointer(Void)?
      # g_async_result_get_user_data: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_async_result_get_user_data(self)

      # Return value handling

      _retval unless _retval.null?
    end

    def is_tagged(source_tag : Pointer(Void)?) : Bool
      # g_async_result_is_tagged: (Method)
      # @source_tag: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      source_tag = if source_tag.nil?
                     Pointer(Void).null
                   else
                     source_tag.to_unsafe
                   end

      # C call
      _retval = LibGio.g_async_result_is_tagged(self, source_tag)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def legacy_propagate_error : Bool
      # g_async_result_legacy_propagate_error: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_async_result_legacy_propagate_error(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AsyncResult__Impl < GObject::Object
    include AsyncResult

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_async_result_get_type
    end

    # Cast a `GObject::Object` to `AsyncResult`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to AsyncResult")
    end

    # Cast a `GObject::Object` to `AsyncResult`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
