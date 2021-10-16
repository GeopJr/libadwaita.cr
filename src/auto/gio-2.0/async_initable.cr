module Gio
  # This is the asynchronous version of #GInitable; it behaves the same
  # in all ways except that initialization is asynchronous. For more details
  # see the descriptions on #GInitable.
  #
  # A class may implement both the #GInitable and #GAsyncInitable interfaces.
  #
  # Users of objects implementing this are not intended to use the interface
  # method directly; instead it will be used automatically in various ways.
  # For C applications you generally just call g_async_initable_new_async()
  # directly, or indirectly via a foo_thing_new_async() wrapper. This will call
  # g_async_initable_init_async() under the cover, calling back with %NULL and
  # a set %GError on failure.
  #
  # A typical implementation might look something like this:
  #
  # |[<!-- language="C" -->
  # enum {
  #    NOT_INITIALIZED,
  #    INITIALIZING,
  #    INITIALIZED
  # };
  #
  # static void
  # _foo_ready_cb (Foo *self)
  # {
  #   GList *l;
  #
  #   self->priv->state = INITIALIZED;
  #
  #   for (l = self->priv->init_results; l != NULL; l = l->next)
  #     {
  #       GTask *task = l->data;
  #
  #       if (self->priv->success)
  #         g_task_return_boolean (task, TRUE);
  #       else
  #         g_task_return_new_error (task, ...);
  #       g_object_unref (task);
  #     }
  #
  #   g_list_free (self->priv->init_results);
  #   self->priv->init_results = NULL;
  # }
  #
  # static void
  # foo_init_async (GAsyncInitable       *initable,
  #                 int                   io_priority,
  #                 GCancellable         *cancellable,
  #                 GAsyncReadyCallback   callback,
  #                 gpointer              user_data)
  # {
  #   Foo *self = FOO (initable);
  #   GTask *task;
  #
  #   task = g_task_new (initable, cancellable, callback, user_data);
  #   g_task_set_name (task, G_STRFUNC);
  #
  #   switch (self->priv->state)
  #     {
  #       case NOT_INITIALIZED:
  #         _foo_get_ready (self);
  #         self->priv->init_results = g_list_append (self->priv->init_results,
  #                                                   task);
  #         self->priv->state = INITIALIZING;
  #         break;
  #       case INITIALIZING:
  #         self->priv->init_results = g_list_append (self->priv->init_results,
  #                                                   task);
  #         break;
  #       case INITIALIZED:
  #         if (!self->priv->success)
  #           g_task_return_new_error (task, ...);
  #         else
  #           g_task_return_boolean (task, TRUE);
  #         g_object_unref (task);
  #         break;
  #     }
  # }
  #
  # static gboolean
  # foo_init_finish (GAsyncInitable       *initable,
  #                  GAsyncResult         *result,
  #                  GError              **error)
  # {
  #   g_return_val_if_fail (g_task_is_valid (result, initable), FALSE);
  #
  #   return g_task_propagate_boolean (G_TASK (result), error);
  # }
  #
  # static void
  # foo_async_initable_iface_init (gpointer g_iface,
  #                                gpointer data)
  # {
  #   GAsyncInitableIface *iface = g_iface;
  #
  #   iface->init_async = foo_init_async;
  #   iface->init_finish = foo_init_finish;
  # }
  # ]|
  module AsyncInitable
    def self.newv_async(object_type : UInt64, n_parameters : UInt32, parameters : GObject::Parameter, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_async_initable_newv_async: (None)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_async_initable_newv_async(object_type, n_parameters, parameters, io_priority, cancellable, callback, user_data)
    end

    def init_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_async_initable_init_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_async_initable_init_async(self, io_priority, cancellable, callback, user_data)
    end

    def init_finish(res : Gio::AsyncResult) : Bool
      # g_async_initable_init_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_async_initable_init_finish(self, res)
      GICrystal.to_bool(_retval)
    end

    def new_finish(res : Gio::AsyncResult) : GObject::Object
      # g_async_initable_new_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_async_initable_new_finish(self, res)
      GObject::Object.new(_retval, GICrystal::Transfer::Full)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class AsyncInitable__Impl
    include AsyncInitable

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_async_initable_get_type
    end

    # Cast a `GObject::Object` to `AsyncInitable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to AsyncInitable")
    end

    # Cast a `GObject::Object` to `AsyncInitable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
