module Gio
  # Extends the #GIcon interface and adds the ability to
  # load icons from streams.
  module LoadableIcon
    def load(size : Int32, cancellable : Gio::Cancellable?) : Gio::InputStream
      # g_loadable_icon_load: (Method | Throws)
      # @type: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      type = Pointer(Pointer(LibC::Char)).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_loadable_icon_load(self, size, type, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::InputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def load_async(size : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_loadable_icon_load_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_loadable_icon_load_async(self, size, cancellable, callback, user_data)

      # Return value handling
    end

    def load_finish(res : Gio::AsyncResult) : Gio::InputStream
      # g_loadable_icon_load_finish: (Method | Throws)
      # @type: (out) (transfer full) (optional)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      type = Pointer(Pointer(LibC::Char)).null
      # C call
      _retval = LibGio.g_loadable_icon_load_finish(self, res, type, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::InputStream.new(_retval, GICrystal::Transfer::Full)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class LoadableIcon__Impl < GObject::Object
    include LoadableIcon

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
