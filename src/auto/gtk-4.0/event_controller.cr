require "../g_object-2.0/object"

module Gtk
  # `GtkEventController` is the base class for event controllers.
  #
  # These are ancillary objects associated to widgets, which react
  # to `GdkEvents`, and possibly trigger actions as a consequence.
  #
  # Event controllers are added to a widget with
  # `Gtk::Widget#add_controller`. It is rarely necessary to
  # explicitly remove a controller with `Gtk::Widget#remove_controller`.
  #
  # See the chapter on [input handling](input-handling.html) for
  # an overview of the basic concepts, such as the capture and bubble
  # phases of even propagation.
  @[GObject::GeneratedWrapper]
  class EventController < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::EventControllerClass), class_init,
        sizeof(LibGtk::EventController), instance_init, 0)
    end

    GICrystal.define_new_method(EventController, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `EventController`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

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

      @pointer = LibGObject.g_object_new_with_properties(EventController.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_event_controller_get_type
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def propagation_limit=(value : Gtk::PropagationLimit) : Gtk::PropagationLimit
      unsafe_value = value

      LibGObject.g_object_set(self, "propagation-limit", unsafe_value, Pointer(Void).null)
      value
    end

    def propagation_limit : Gtk::PropagationLimit
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "propagation-limit", pointerof(value), Pointer(Void).null)
      Gtk::PropagationLimit.new(value)
    end

    def propagation_phase=(value : Gtk::PropagationPhase) : Gtk::PropagationPhase
      unsafe_value = value

      LibGObject.g_object_set(self, "propagation-phase", unsafe_value, Pointer(Void).null)
      value
    end

    def propagation_phase : Gtk::PropagationPhase
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "propagation-phase", pointerof(value), Pointer(Void).null)
      Gtk::PropagationPhase.new(value)
    end

    def widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Returns the event that is currently being handled by the controller.
    #
    # At other times, %NULL is returned.
    def current_event : Gdk::Event?
      # gtk_event_controller_get_current_event: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_get_current_event(@pointer)

      # Return value handling

      Gdk::Event.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the device of the event that is currently being
    # handled by the controller.
    #
    # At other times, %NULL is returned.
    def current_event_device : Gdk::Device?
      # gtk_event_controller_get_current_event_device: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_get_current_event_device(@pointer)

      # Return value handling

      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the modifier state of the event that is currently being
    # handled by the controller.
    #
    # At other times, 0 is returned.
    def current_event_state : Gdk::ModifierType
      # gtk_event_controller_get_current_event_state: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_get_current_event_state(@pointer)

      # Return value handling

      Gdk::ModifierType.new(_retval)
    end

    # Returns the timestamp of the event that is currently being
    # handled by the controller.
    #
    # At other times, 0 is returned.
    def current_event_time : UInt32
      # gtk_event_controller_get_current_event_time: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_get_current_event_time(@pointer)

      # Return value handling

      _retval
    end

    # Gets the name of @controller.
    def name : ::String?
      # gtk_event_controller_get_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_get_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the propagation limit of the event controller.
    def propagation_limit : Gtk::PropagationLimit
      # gtk_event_controller_get_propagation_limit: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_get_propagation_limit(@pointer)

      # Return value handling

      Gtk::PropagationLimit.new(_retval)
    end

    # Gets the propagation phase at which @controller handles events.
    def propagation_phase : Gtk::PropagationPhase
      # gtk_event_controller_get_propagation_phase: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_get_propagation_phase(@pointer)

      # Return value handling

      Gtk::PropagationPhase.new(_retval)
    end

    # Returns the `GtkWidget` this controller relates to.
    def widget : Gtk::Widget
      # gtk_event_controller_get_widget: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_get_widget(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    # Resets the @controller to a clean state.
    def reset : Nil
      # gtk_event_controller_reset: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_event_controller_reset(@pointer)

      # Return value handling
    end

    # Sets a name on the controller that can be used for debugging.
    def name=(name : ::String?) : Nil
      # gtk_event_controller_set_name: (Method | Setter)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibGtk.gtk_event_controller_set_name(@pointer, name)

      # Return value handling
    end

    # Sets the event propagation limit on the event controller.
    #
    # If the limit is set to %GTK_LIMIT_SAME_NATIVE, the controller
    # won't handle events that are targeted at widgets on a different
    # surface, such as popovers.
    def propagation_limit=(limit : Gtk::PropagationLimit) : Nil
      # gtk_event_controller_set_propagation_limit: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_event_controller_set_propagation_limit(@pointer, limit)

      # Return value handling
    end

    # Sets the propagation phase at which a controller handles events.
    #
    # If @phase is %GTK_PHASE_NONE, no automatic event handling will be
    # performed, but other additional gesture maintenance will.
    def propagation_phase=(phase : Gtk::PropagationPhase) : Nil
      # gtk_event_controller_set_propagation_phase: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_event_controller_set_propagation_phase(@pointer, phase)

      # Return value handling
    end
  end
end
