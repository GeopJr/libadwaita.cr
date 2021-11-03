require "./shortcut_trigger"

module Gtk
  # A `GtkShortcutTrigger` that combines two triggers.
  #
  # The `GtkAlternativeTrigger` triggers when either of two trigger.
  #
  # This can be cascaded to combine more than two triggers.
  class AlternativeTrigger < ShortcutTrigger
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, first : Gtk::ShortcutTrigger? = nil, second : Gtk::ShortcutTrigger? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if first
        (_names.to_unsafe + _n).value = "first".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, first)
        _n += 1
      end
      if second
        (_names.to_unsafe + _n).value = "second".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, second)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(AlternativeTrigger.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_alternative_trigger_get_type
    end

    def first=(value : Gtk::ShortcutTrigger?) : Gtk::ShortcutTrigger?
      unsafe_value = value

      LibGObject.g_object_set(self, "first", unsafe_value, Pointer(Void).null)
      value
    end

    def first : Gtk::ShortcutTrigger?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "first", pointerof(value), Pointer(Void).null)
      Gtk::ShortcutTrigger.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def second=(value : Gtk::ShortcutTrigger?) : Gtk::ShortcutTrigger?
      unsafe_value = value

      LibGObject.g_object_set(self, "second", unsafe_value, Pointer(Void).null)
      value
    end

    def second : Gtk::ShortcutTrigger?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "second", pointerof(value), Pointer(Void).null)
      Gtk::ShortcutTrigger.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize(first : Gtk::ShortcutTrigger, second : Gtk::ShortcutTrigger)
      # gtk_alternative_trigger_new: (Constructor)
      # @first: (transfer full)
      # @second: (transfer full)
      # Returns: (transfer full)

      LibGObject.g_object_ref(first)
      LibGObject.g_object_ref(second)

      _retval = LibGtk.gtk_alternative_trigger_new(first, second)
      @pointer = _retval
    end

    def first : Gtk::ShortcutTrigger
      # gtk_alternative_trigger_get_first: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_alternative_trigger_get_first(self)
      Gtk::ShortcutTrigger.new(_retval, GICrystal::Transfer::None)
    end

    def second : Gtk::ShortcutTrigger
      # gtk_alternative_trigger_get_second: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_alternative_trigger_get_second(self)
      Gtk::ShortcutTrigger.new(_retval, GICrystal::Transfer::None)
    end
  end
end
