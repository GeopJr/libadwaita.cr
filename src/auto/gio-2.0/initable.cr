module Gio
  # #GInitable is implemented by objects that can fail during
  # initialization. If an object implements this interface then
  # it must be initialized as the first thing after construction,
  # either via g_initable_init() or g_async_initable_init_async()
  # (the latter is only available if it also implements #GAsyncInitable).
  #
  # If the object is not initialized, or initialization returns with an
  # error, then all operations on the object except g_object_ref() and
  # g_object_unref() are considered to be invalid, and have undefined
  # behaviour. They will often fail with g_critical() or g_warning(), but
  # this must not be relied on.
  #
  # Users of objects implementing this are not intended to use
  # the interface method directly, instead it will be used automatically
  # in various ways. For C applications you generally just call
  # g_initable_new() directly, or indirectly via a foo_thing_new() wrapper.
  # This will call g_initable_init() under the cover, returning %NULL and
  # setting a #GError on failure (at which point the instance is
  # unreferenced).
  #
  # For bindings in languages where the native constructor supports
  # exceptions the binding could check for objects implementing %GInitable
  # during normal construction and automatically initialize them, throwing
  # an exception on failure.
  module Initable
    def newv(object_type : UInt64, parameters : Enumerable(GObject::Parameter), cancellable : Gio::Cancellable?) : GObject::Object
      # g_initable_newv: (Throws)
      # @parameters: (array length=n_parameters element-type Interface)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      n_parameters = parameters.size
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      parameters = parameters.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGio.g_initable_newv(object_type, n_parameters, parameters, cancellable)
      GObject::Object.new(_retval, GICrystal::Transfer::Full)
    end

    def init(cancellable : Gio::Cancellable?) : Bool
      # g_initable_init: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_initable_init(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Initable__Impl
    include Initable

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
      LibGio.g_initable_get_type
    end

    # Cast a `GObject::Object` to `Initable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Initable")
    end

    # Cast a `GObject::Object` to `Initable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
