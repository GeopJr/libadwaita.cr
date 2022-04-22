require "./gesture"

module Gtk
  # `GtkGestureSingle` is a `GtkGestures` subclass optimized for singe-touch
  # and mouse gestures.
  #
  # Under interaction, these gestures stick to the first interacting sequence,
  # which is accessible through `Gtk::GestureSingle#current_sequence`
  # while the gesture is being interacted with.
  #
  # By default gestures react to both %GDK_BUTTON_PRIMARY and touch events.
  # `Gtk::GestureSingle#touch_only=` can be used to change the
  # touch behavior. Callers may also specify a different mouse button number
  # to interact with through `Gtk::GestureSingle#button=`, or react
  # to any mouse button by setting it to 0. While the gesture is active, the
  # button being currently pressed can be known through
  # `Gtk::GestureSingle#current_button`.
  @[GObject::GeneratedWrapper]
  class GestureSingle < Gesture
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GestureSingleClass), class_init,
        sizeof(LibGtk::GestureSingle), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, button : UInt32? = nil, exclusive : Bool? = nil, n_points : UInt32? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, touch_only : Bool? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[8]
      _values = StaticArray(LibGObject::Value, 8).new(LibGObject::Value.new)
      _n = 0

      if !button.nil?
        (_names.to_unsafe + _n).value = "button".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, button)
        _n += 1
      end
      if !exclusive.nil?
        (_names.to_unsafe + _n).value = "exclusive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, exclusive)
        _n += 1
      end
      if !n_points.nil?
        (_names.to_unsafe + _n).value = "n-points".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_points)
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
      if !touch_only.nil?
        (_names.to_unsafe + _n).value = "touch-only".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, touch_only)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GestureSingle.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gesture_single_get_type
    end

    def button=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "button", unsafe_value, Pointer(Void).null)
      value
    end

    def button : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "button", pointerof(value), Pointer(Void).null)
      value
    end

    def exclusive=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "exclusive", unsafe_value, Pointer(Void).null)
      value
    end

    def exclusive? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "exclusive", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def touch_only=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "touch-only", unsafe_value, Pointer(Void).null)
      value
    end

    def touch_only? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "touch-only", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Returns the button number @gesture listens for.
    #
    # If this is 0, the gesture reacts to any button press.
    def button : UInt32
      # gtk_gesture_single_get_button: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_single_get_button(self)

      # Return value handling

      _retval
    end

    # Returns the button number currently interacting
    # with @gesture, or 0 if there is none.
    def current_button : UInt32
      # gtk_gesture_single_get_current_button: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_single_get_current_button(self)

      # Return value handling

      _retval
    end

    # Returns the event sequence currently interacting with @gesture.
    #
    # This is only meaningful if `Gtk::Gesture#is_active?`
    # returns %TRUE.
    def current_sequence : Gdk::EventSequence?
      # gtk_gesture_single_get_current_sequence: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_gesture_single_get_current_sequence(self)

      # Return value handling

      Gdk::EventSequence.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets whether a gesture is exclusive.
    #
    # For more information, see `Gtk::GestureSingle#exclusive=`.
    def exclusive : Bool
      # gtk_gesture_single_get_exclusive: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_single_get_exclusive(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns %TRUE if the gesture is only triggered by touch events.
    def touch_only : Bool
      # gtk_gesture_single_get_touch_only: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_single_get_touch_only(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the button number @gesture listens to.
    #
    # If non-0, every button press from a different button
    # number will be ignored. Touch events implicitly match
    # with button 1.
    def button=(button : UInt32) : Nil
      # gtk_gesture_single_set_button: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gesture_single_set_button(self, button)

      # Return value handling
    end

    # Sets whether @gesture is exclusive.
    #
    # An exclusive gesture will only handle pointer and "pointer emulated"
    # touch events, so at any given time, there is only one sequence able
    # to interact with those.
    def exclusive=(exclusive : Bool) : Nil
      # gtk_gesture_single_set_exclusive: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gesture_single_set_exclusive(self, exclusive)

      # Return value handling
    end

    # Sets whether to handle only touch events.
    #
    # If @touch_only is %TRUE, @gesture will only handle events of type
    # %GDK_TOUCH_BEGIN, %GDK_TOUCH_UPDATE or %GDK_TOUCH_END. If %FALSE,
    # mouse events will be handled too.
    def touch_only=(touch_only : Bool) : Nil
      # gtk_gesture_single_set_touch_only: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gesture_single_set_touch_only(self, touch_only)

      # Return value handling
    end
  end
end
