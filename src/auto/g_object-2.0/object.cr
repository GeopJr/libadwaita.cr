module GObject
  # The base object type.
  #
  # All the fields in the `GObject` structure are private to the implementation
  # and should never be accessed directly.
  class Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Cast a `GObject::Object` to `Object`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Object")
    end

    # Cast a `GObject::Object` to `Object`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.g_object_get_type
    end

    def self.newv(object_type : UInt64, parameters : Enumerable(GObject::Parameter)) : GObject::Object
      # g_object_newv: (Constructor)
      # @parameters: (array length=n_parameters element-type Interface)
      # Returns: (transfer full)

      n_parameters = parameters.size
      parameters = parameters.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGObject.g_object_newv(object_type, n_parameters, parameters)
      GObject::Object.new(_retval, GICrystal::Transfer::Full)
    end

    def self.compat_control(what : UInt64, data : Pointer(Nil)?) : UInt64
      # g_object_compat_control: (None)
      # @data: (nullable)
      # Returns: (transfer none)

      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      _retval = LibGObject.g_object_compat_control(what, data)
      _retval
    end

    def self.interface_find_property(g_iface : GObject::TypeInterface, property_name : ::String) : GObject::ParamSpec
      # g_object_interface_find_property: (None)
      # Returns: (transfer none)

      _retval = LibGObject.g_object_interface_find_property(g_iface, property_name)
      GObject::ParamSpec.new(_retval, GICrystal::Transfer::None)
    end

    def bind_property(source_property : ::String, target : GObject::Object, target_property : ::String, flags : GObject::BindingFlags) : GObject::Binding
      # g_object_bind_property: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_object_bind_property(self, source_property, target, target_property, flags)
      GObject::Binding.new(_retval, GICrystal::Transfer::None)
    end

    def bind_property_full(source_property : ::String, target : GObject::Object, target_property : ::String, flags : GObject::BindingFlags, transform_to : GObject::Closure, transform_from : GObject::Closure) : GObject::Binding
      # g_object_bind_property_with_closures: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_object_bind_property_with_closures(self, source_property, target, target_property, flags, transform_to, transform_from)
      GObject::Binding.new(_retval, GICrystal::Transfer::None)
    end

    def force_floating : Nil
      # g_object_force_floating: (Method)
      # Returns: (transfer none)

      LibGObject.g_object_force_floating(self)
    end

    def freeze_notify : Nil
      # g_object_freeze_notify: (Method)
      # Returns: (transfer none)

      LibGObject.g_object_freeze_notify(self)
    end

    def data(key : ::String) : Pointer(Nil)?
      # g_object_get_data: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_object_get_data(self, key)
      Pointer(Void) unless _retval.null?
    end

    def property(property_name : ::String, value : _) : Nil
      # g_object_get_property: (Method)
      # Returns: (transfer none)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      LibGObject.g_object_get_property(self, property_name, value)
    end

    def qdata(quark : UInt32) : Pointer(Nil)?
      # g_object_get_qdata: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_object_get_qdata(self, quark)
      Pointer(Void) unless _retval.null?
    end

    def getv(names : Enumerable(::String), values : Enumerable(_)) : Nil
      # g_object_getv: (Method)
      # @names: (array length=n_properties element-type Utf8)
      # @values: (array length=n_properties element-type Interface)
      # Returns: (transfer none)

      n_properties = names.size
      n_properties = values.size
      names = names.to_a.map(&.to_unsafe).to_unsafe

      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      LibGObject.g_object_getv(self, n_properties, names, values)
    end

    def is_floating : Bool
      # g_object_is_floating: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_object_is_floating(self)
      GICrystal.to_bool(_retval)
    end

    def notify(property_name : ::String) : Nil
      # g_object_notify: (Method)
      # Returns: (transfer none)

      LibGObject.g_object_notify(self, property_name)
    end

    def ref_sink : GObject::Object
      # g_object_ref_sink: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_object_ref_sink(self)
      GObject::Object.new(_retval, GICrystal::Transfer::None)
    end

    def run_dispose : Nil
      # g_object_run_dispose: (Method)
      # Returns: (transfer none)

      LibGObject.g_object_run_dispose(self)
    end

    def set_data(key : ::String, data : Pointer(Nil)?) : Nil
      # g_object_set_data: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      LibGObject.g_object_set_data(self, key, data)
    end

    def set_property(property_name : ::String, value : _) : Nil
      # g_object_set_property: (Method)
      # Returns: (transfer none)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      LibGObject.g_object_set_property(self, property_name, value)
    end

    def steal_data(key : ::String) : Pointer(Nil)?
      # g_object_steal_data: (Method)
      # Returns: (transfer full)

      _retval = LibGObject.g_object_steal_data(self, key)
      Pointer(Void) unless _retval.null?
    end

    def steal_qdata(quark : UInt32) : Pointer(Nil)?
      # g_object_steal_qdata: (Method)
      # Returns: (transfer full)

      _retval = LibGObject.g_object_steal_qdata(self, quark)
      Pointer(Void) unless _retval.null?
    end

    def thaw_notify : Nil
      # g_object_thaw_notify: (Method)
      # Returns: (transfer none)

      LibGObject.g_object_thaw_notify(self)
    end

    def watch_closure(closure : GObject::Closure) : Nil
      # g_object_watch_closure: (Method)
      # Returns: (transfer none)

      LibGObject.g_object_watch_closure(self, closure)
    end

    struct NotifySignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "notify::#{@detail}" : "notify"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(GObject::Object, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = GObject::Object.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GObject::Object, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GObject::Object, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = GObject::Object.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GObject::Object, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "notify")
      end
    end

    def notify_signal
      NotifySignal.new(self)
    end
  end
end
