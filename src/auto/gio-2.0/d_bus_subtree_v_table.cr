module Gio
  # Virtual table for handling subtrees registered with g_dbus_connection_register_subtree().
  class DBusSubtreeVTable
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::DBusSubtreeVTable))
      @pointer.copy_from(pointer, sizeof(LibGio::DBusSubtreeVTable))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(enumerate : Pointer(Void)? = nil, introspect : Pointer(Void)? = nil, dispatch : Pointer(Void)? = nil, padding : Enumerable(Pointer(Nil))? = nil)
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

    def enumerate : Pointer(Void)
      # Property getter
      _var = (@pointer + 0).as(Pointer(LibGio::DBusSubtreeEnumerateFunc))
      Pointer(Void).new(_var.value, GICrystal::Transfer::Full)
    end

    def enumerate=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 0).as(Pointer(LibGio::DBusSubtreeEnumerateFunc)).value = value.to_unsafe
      value
    end

    def introspect : Pointer(Void)
      # Property getter
      _var = (@pointer + 8).as(Pointer(LibGio::DBusSubtreeIntrospectFunc))
      Pointer(Void).new(_var.value, GICrystal::Transfer::Full)
    end

    def introspect=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 8).as(Pointer(LibGio::DBusSubtreeIntrospectFunc)).value = value.to_unsafe
      value
    end

    def dispatch : Pointer(Void)
      # Property getter
      _var = (@pointer + 16).as(Pointer(LibGio::DBusSubtreeDispatchFunc))
      Pointer(Void).new(_var.value, GICrystal::Transfer::Full)
    end

    def dispatch=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 16).as(Pointer(LibGio::DBusSubtreeDispatchFunc)).value = value.to_unsafe
      value
    end

    def padding : Enumerable(Pointer(Nil))
      # Property getter
      _var = (@pointer + 24).as(Pointer(Pointer(Void)[8]))
      _var.value
    end

    def padding=(value : Enumerable(Pointer(Nil)))
      # Property setter
      _var = (@pointer + 24).as(Pointer(Pointer(Void)[8])).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
