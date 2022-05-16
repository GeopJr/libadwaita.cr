require "./event_controller"

module Gtk
  # `GtkEventControllerFocus` is an event controller to keep track of
  # keyboard focus.
  #
  # The event controller offers `Gtk::EventControllerFocus::#enter`
  # and `Gtk::EventControllerFocus::#leave` signals, as well as
  # [property@Gtk.EventControllerFocus:is-focus] and
  # [property@Gtk.EventControllerFocus:contains-focus] properties
  # which are updated to reflect focus changes inside the widget hierarchy
  # that is rooted at the controllers widget.
  @[GObject::GeneratedWrapper]
  class EventControllerFocus < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::EventControllerFocusClass), class_init,
        sizeof(LibGtk::EventControllerFocus), instance_init, 0)
    end

    GICrystal.define_new_method(EventControllerFocus, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `EventControllerFocus`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, contains_focus : Bool? = nil, is_focus : Bool? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if !contains_focus.nil?
        (_names.to_unsafe + _n).value = "contains-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, contains_focus)
        _n += 1
      end
      if !is_focus.nil?
        (_names.to_unsafe + _n).value = "is-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_focus)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !propagation_limit.nil?
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if !propagation_phase.nil?
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EventControllerFocus.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_event_controller_focus_get_type
    end

    def contains_focus? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "contains-focus", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_focus? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-focus", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new event controller that will handle focus events.
    def initialize
      # gtk_event_controller_focus_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_event_controller_focus_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns %TRUE if focus is within @self or one of its children.
    def contains_focus : Bool
      # gtk_event_controller_focus_contains_focus: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_focus_contains_focus(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns %TRUE if focus is within @self, but not one of its children.
    def is_focus? : Bool
      # gtk_event_controller_focus_is_focus: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_focus_is_focus(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted whenever the focus enters into the widget or one
    # of its descendents.
    #
    # Note that this means you may not get an ::enter signal
    # even though the widget becomes the focus location, in
    # certain cases (such as when the focus moves from a descendent
    # of the widget to the widget itself). If you are interested
    # in these cases, you can monitor the
    # [property@Gtk.EventControllerFocus:is-focus]
    # property for changes.
    struct EnterSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "enter::#{@detail}" : "enter"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::EventControllerFocus, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerFocus.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerFocus, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::EventControllerFocus, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerFocus.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerFocus, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "enter")
      end
    end

    def enter_signal
      EnterSignal.new(self)
    end

    # Emitted whenever the focus leaves the widget hierarchy
    # that is rooted at the widget that the controller is attached to.
    #
    # Note that this means you may not get a ::leave signal
    # even though the focus moves away from the widget, in
    # certain cases (such as when the focus moves from the widget
    # to a descendent). If you are interested in these cases, you
    # can monitor the [property@Gtk.EventControllerFocus:is-focus]
    # property for changes.
    struct LeaveSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "leave::#{@detail}" : "leave"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::EventControllerFocus, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerFocus.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerFocus, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::EventControllerFocus, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerFocus.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerFocus, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "leave")
      end
    end

    def leave_signal
      LeaveSignal.new(self)
    end
  end
end
