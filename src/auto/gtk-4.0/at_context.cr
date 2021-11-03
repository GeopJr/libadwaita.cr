require "../g_object-2.0/object"

module Gtk
  # `GtkATContext` is an abstract class provided by GTK to communicate to
  # platform-specific assistive technologies API.
  #
  # Each platform supported by GTK implements a `GtkATContext` subclass, and
  # is responsible for updating the accessible state in response to state
  # changes in `GtkAccessible`.
  class ATContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible : Gtk::Accessible? = nil, accessible_role : Gtk::AccessibleRole? = nil, display : Gdk::Display? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if accessible
        (_names.to_unsafe + _n).value = "accessible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible)
        _n += 1
      end
      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ATContext.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_at_context_get_type
    end

    def accessible=(value : Gtk::Accessible?) : Gtk::Accessible?
      unsafe_value = value

      LibGObject.g_object_set(self, "accessible", unsafe_value, Pointer(Void).null)
      value
    end

    def accessible : Gtk::Accessible?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "accessible", pointerof(value), Pointer(Void).null)
      Gtk::Accessible__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def accessible_role=(value : Gtk::AccessibleRole) : Gtk::AccessibleRole
      unsafe_value = value

      LibGObject.g_object_set(self, "accessible-role", unsafe_value, Pointer(Void).null)
      value
    end

    def accessible_role : Gtk::AccessibleRole
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "accessible-role", pointerof(value), Pointer(Void).null)
      Gtk::AccessibleRole.from_value(value)
    end

    def display=(value : Gdk::Display?) : Gdk::Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def display : Gdk::Display?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "display", pointerof(value), Pointer(Void).null)
      Gdk::Display.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def self.create(accessible_role : Gtk::AccessibleRole, accessible : Gtk::Accessible, display : Gdk::Display) : Gtk::ATContext?
      # gtk_at_context_create: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_at_context_create(accessible_role, accessible, display)
      Gtk::ATContext.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def accessible : Gtk::Accessible
      # gtk_at_context_get_accessible: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_at_context_get_accessible(self)
      Gtk::Accessible__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def accessible_role : Gtk::AccessibleRole
      # gtk_at_context_get_accessible_role: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_at_context_get_accessible_role(self)
      Gtk::AccessibleRole.from_value(_retval)
    end

    struct StateChangeSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "state-change::#{@detail}" : "state-change"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ATContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ATContext.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ATContext, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ATContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ATContext.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ATContext, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "state-change")
      end
    end

    def state_change_signal
      StateChangeSignal.new(self)
    end
  end
end
