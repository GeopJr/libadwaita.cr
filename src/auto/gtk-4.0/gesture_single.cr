require "./gesture"

module Gtk
  # `GtkGestureSingle` is a `GtkGestures` subclass optimized for singe-touch
  # and mouse gestures.
  #
  # Under interaction, these gestures stick to the first interacting sequence,
  # which is accessible through [method@Gtk.GestureSingle.get_current_sequence]
  # while the gesture is being interacted with.
  #
  # By default gestures react to both %GDK_BUTTON_PRIMARY and touch events.
  # [method@Gtk.GestureSingle.set_touch_only] can be used to change the
  # touch behavior. Callers may also specify a different mouse button number
  # to interact with through [method@Gtk.GestureSingle.set_button], or react
  # to any mouse button by setting it to 0. While the gesture is active, the
  # button being currently pressed can be known through
  # [method@Gtk.GestureSingle.get_current_button].
  class GestureSingle < Gesture
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, button : UInt32? = nil, exclusive : Bool? = nil, n_points : UInt32? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, touch_only : Bool? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[8]
      _values = StaticArray(LibGObject::Value, 8).new(LibGObject::Value.new)
      _n = 0

      if button
        (_names.to_unsafe + _n).value = "button".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, button)
        _n += 1
      end
      if exclusive
        (_names.to_unsafe + _n).value = "exclusive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, exclusive)
        _n += 1
      end
      if n_points
        (_names.to_unsafe + _n).value = "n-points".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_points)
        _n += 1
      end
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
      if touch_only
        (_names.to_unsafe + _n).value = "touch-only".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, touch_only)
        _n += 1
      end
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GestureSingle.g_type, _n, _names, _values)
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

    def button : UInt32
      # gtk_gesture_single_get_button: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_gesture_single_get_button(self)

      # Return value handling
      _retval
    end

    def current_button : UInt32
      # gtk_gesture_single_get_current_button: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_gesture_single_get_current_button(self)

      # Return value handling
      _retval
    end

    def current_sequence : Gdk::EventSequence?
      # gtk_gesture_single_get_current_sequence: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_gesture_single_get_current_sequence(self)

      # Return value handling
      Gdk::EventSequence.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def exclusive : Bool
      # gtk_gesture_single_get_exclusive: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_gesture_single_get_exclusive(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def touch_only : Bool
      # gtk_gesture_single_get_touch_only: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_gesture_single_get_touch_only(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def button=(button : UInt32) : Nil
      # gtk_gesture_single_set_button: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_gesture_single_set_button(self, button)

      # Return value handling
    end

    def exclusive=(exclusive : Bool) : Nil
      # gtk_gesture_single_set_exclusive: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_gesture_single_set_exclusive(self, exclusive)

      # Return value handling
    end

    def touch_only=(touch_only : Bool) : Nil
      # gtk_gesture_single_set_touch_only: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_gesture_single_set_touch_only(self, touch_only)

      # Return value handling
    end
  end
end
