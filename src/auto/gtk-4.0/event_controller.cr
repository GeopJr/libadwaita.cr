require "../g_object-2.0/object"

module Gtk
  # `GtkEventController` is the base class for event controllers.
  #
  # These are ancillary objects associated to widgets, which react
  # to `GdkEvents`, and possibly trigger actions as a consequence.
  #
  # Event controllers are added to a widget with
  # [method@Gtk.Widget.add_controller]. It is rarely necessary to
  # explicitly remove a controller with [method@Gtk.Widget.remove_controller].
  #
  # See the chapter on [input handling](input-handling.html) for
  # an overview of the basic concepts, such as the capture and bubble
  # phases of even propagation.
  class EventController < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if propagation_limit
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if propagation_phase
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EventController.g_type, _n, _names, _values)
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
      Gtk::PropagationLimit.from_value(value)
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
      Gtk::PropagationPhase.from_value(value)
    end

    def widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def current_event : Gdk::Event?
      # gtk_event_controller_get_current_event: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_event_controller_get_current_event(self)

      # Return value handling
      Gdk::Event.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def current_event_device : Gdk::Device?
      # gtk_event_controller_get_current_event_device: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_event_controller_get_current_event_device(self)

      # Return value handling
      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def current_event_state : Gdk::ModifierType
      # gtk_event_controller_get_current_event_state: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_event_controller_get_current_event_state(self)

      # Return value handling
      Gdk::ModifierType.from_value(_retval)
    end

    def current_event_time : UInt32
      # gtk_event_controller_get_current_event_time: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_event_controller_get_current_event_time(self)

      # Return value handling
      _retval
    end

    def name : ::String?
      # gtk_event_controller_get_name: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_event_controller_get_name(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def propagation_limit : Gtk::PropagationLimit
      # gtk_event_controller_get_propagation_limit: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_event_controller_get_propagation_limit(self)

      # Return value handling
      Gtk::PropagationLimit.from_value(_retval)
    end

    def propagation_phase : Gtk::PropagationPhase
      # gtk_event_controller_get_propagation_phase: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_event_controller_get_propagation_phase(self)

      # Return value handling
      Gtk::PropagationPhase.from_value(_retval)
    end

    def widget : Gtk::Widget
      # gtk_event_controller_get_widget: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_event_controller_get_widget(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    def reset : Nil
      # gtk_event_controller_reset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_event_controller_reset(self)

      # Return value handling
    end

    def name=(name : ::String?) : Nil
      # gtk_event_controller_set_name: (Method | Setter)
      # @name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibGtk.gtk_event_controller_set_name(self, name)

      # Return value handling
    end

    def propagation_limit=(limit : Gtk::PropagationLimit) : Nil
      # gtk_event_controller_set_propagation_limit: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_event_controller_set_propagation_limit(self, limit)

      # Return value handling
    end

    def propagation_phase=(phase : Gtk::PropagationPhase) : Nil
      # gtk_event_controller_set_propagation_phase: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_event_controller_set_propagation_phase(self, phase)

      # Return value handling
    end
  end
end
