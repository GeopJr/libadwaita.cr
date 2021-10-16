module Gio
  # Extends the #GIcon interface and adds the ability to
  # load icons from streams.
  module LoadableIcon
    def load(size : Int32, cancellable : Gio::Cancellable?) : Gio::InputStream
      # g_loadable_icon_load: (Method | Throws)
      # @type: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      type = Pointer(Pointer(LibC::Char)).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_loadable_icon_load(self, size, type, cancellable)
      Gio::InputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def load_async(size : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_loadable_icon_load_async: (Method)
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

      LibGio.g_loadable_icon_load_async(self, size, cancellable, callback, user_data)
    end

    def load_finish(res : Gio::AsyncResult) : Gio::InputStream
      # g_loadable_icon_load_finish: (Method | Throws)
      # @type: (out) (transfer full) (optional)
      # Returns: (transfer full)

      type = Pointer(Pointer(LibC::Char)).null

      _retval = LibGio.g_loadable_icon_load_finish(self, res, type)
      Gio::InputStream.new(_retval, GICrystal::Transfer::Full)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class LoadableIcon__Impl
    include LoadableIcon

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
      LibGio.g_loadable_icon_get_type
    end

    # Cast a `GObject::Object` to `LoadableIcon`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to LoadableIcon")
    end

    # Cast a `GObject::Object` to `LoadableIcon`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
