require "../g_object-2.0/object"

module Gtk
  # `GtkATContext` is an abstract class provided by GTK to communicate to
  # platform-specific assistive technologies API.
  #
  # Each platform supported by GTK implements a `GtkATContext` subclass, and
  # is responsible for updating the accessible state in response to state
  # changes in `GtkAccessible`.
  @[GObject::GeneratedWrapper]
  class ATContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ATContextClass), class_init,
        sizeof(LibGtk::ATContext), instance_init, 0)
    end

    GICrystal.define_new_method(ATContext, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ATContext`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible : Gtk::Accessible? = nil, accessible_role : Gtk::AccessibleRole? = nil, display : Gdk::Display? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !accessible.nil?
        (_names.to_unsafe + _n).value = "accessible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible)
        _n += 1
      end
      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ATContext.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gtk::AbstractAccessible.new(value, GICrystal::Transfer::None) unless value.null?
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
      Gtk::AccessibleRole.new(value)
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

    # Creates a new `GtkATContext` instance for the given accessible role,
    # accessible instance, and display connection.
    #
    # The `GtkATContext` implementation being instantiated will depend on the
    # platform.
    def self.create(accessible_role : Gtk::AccessibleRole, accessible : Gtk::Accessible, display : Gdk::Display) : self?
      # gtk_at_context_create: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_at_context_create(accessible_role, accessible, display)

      # Return value handling

      Gtk::ATContext.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Retrieves the `GtkAccessible` using this context.
    def accessible : Gtk::Accessible
      # gtk_at_context_get_accessible: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_at_context_get_accessible(@pointer)

      # Return value handling

      Gtk::AbstractAccessible.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the accessible role of this context.
    def accessible_role : Gtk::AccessibleRole
      # gtk_at_context_get_accessible_role: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_at_context_get_accessible_role(@pointer)

      # Return value handling

      Gtk::AccessibleRole.new(_retval)
    end

    # Emitted when the attributes of the accessible for the
    # `GtkATContext` instance change.
    struct StateChangeSignal < GObject::Signal
      def name : String
        @detail ? "state-change::#{@detail}" : "state-change"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::ATContext, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ATContext.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ATContext, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
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
