module Gio
  # Virtual table for handling subtrees registered with g_dbus_connection_register_subtree().
  class DBusSubtreeVTable
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::DBusSubtreeVTable))
      @pointer.copy_from(pointer, sizeof(LibGio::DBusSubtreeVTable))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(enumerate : Gio::DBusSubtreeEnumerateFunc? = nil, introspect : Gio::DBusSubtreeIntrospectFunc? = nil, dispatch : Gio::DBusSubtreeDispatchFunc? = nil, padding : Enumerable(Pointer(Void))? = nil)
      _ptr = Pointer(Void).malloc(88)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.enumerate = enumerate unless enumerate.nil?
      _instance.introspect = introspect unless introspect.nil?
      _instance.dispatch = dispatch unless dispatch.nil?
      _instance.padding = padding unless padding.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::DBusSubtreeVTable)).zero?
    end

    def enumerate : Gio::DBusSubtreeEnumerateFunc
      _var = (@pointer + 0).as(Pointer(Void*))
      Gio::DBusSubtreeEnumerateFunc.new(_var, GICrystal::Transfer::None)
    end

    def enumerate=(value : Gio::DBusSubtreeEnumerateFunc)
      _var = (@pointer + 0).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGio::DBusSubtreeVTable))
      value
    end

    def introspect : Gio::DBusSubtreeIntrospectFunc
      _var = (@pointer + 8).as(Pointer(Void*))
      Gio::DBusSubtreeIntrospectFunc.new(_var, GICrystal::Transfer::None)
    end

    def introspect=(value : Gio::DBusSubtreeIntrospectFunc)
      _var = (@pointer + 8).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGio::DBusSubtreeVTable))
      value
    end

    def dispatch : Gio::DBusSubtreeDispatchFunc
      _var = (@pointer + 16).as(Pointer(Void*))
      Gio::DBusSubtreeDispatchFunc.new(_var, GICrystal::Transfer::None)
    end

    def dispatch=(value : Gio::DBusSubtreeDispatchFunc)
      _var = (@pointer + 16).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGio::DBusSubtreeVTable))
      value
    end

    def padding : Enumerable(Pointer(Void))
      _var = (@pointer + 24).as(Pointer(Pointer(Void)[8]))
      _var.value
    end

    def padding=(value : Enumerable(Pointer(Void)))
      _var = (@pointer + 24).as(Pointer(Pointer(Void)[8])).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
