require "./shortcut_trigger"

module Gtk
  # A `GtkShortcutTrigger` that combines two triggers.
  #
  # The `GtkAlternativeTrigger` triggers when either of two trigger.
  #
  # This can be cascaded to combine more than two triggers.
  @[GObject::GeneratedWrapper]
  class AlternativeTrigger < ShortcutTrigger
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::AlternativeTriggerClass), class_init,
        sizeof(LibGtk::AlternativeTrigger), instance_init, 0)
    end

    GICrystal.define_new_method(AlternativeTrigger, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `AlternativeTrigger`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, first : Gtk::ShortcutTrigger? = nil, second : Gtk::ShortcutTrigger? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !first.nil?
        (_names.to_unsafe + _n).value = "first".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, first)
        _n += 1
      end
      if !second.nil?
        (_names.to_unsafe + _n).value = "second".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, second)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(AlternativeTrigger.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a `GtkShortcutTrigger` that will trigger whenever
    # either of the two given triggers gets triggered.
    #
    # Note that nesting is allowed, so if you want more than two
    # alternative, create a new alternative trigger for each option.
    def initialize(first : Gtk::ShortcutTrigger, second : Gtk::ShortcutTrigger)
      # gtk_alternative_trigger_new: (Constructor)
      # @first: (transfer full)
      # @second: (transfer full)
      # Returns: (transfer full)

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(first) # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(second)
      # C call
      _retval = LibGtk.gtk_alternative_trigger_new(first, second)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the first of the two alternative triggers that may
    # trigger @self.
    #
    # `Gtk::AlternativeTrigger#second` will return
    # the other one.
    def first : Gtk::ShortcutTrigger
      # gtk_alternative_trigger_get_first: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_alternative_trigger_get_first(@pointer)

      # Return value handling

      Gtk::ShortcutTrigger.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the second of the two alternative triggers that may
    # trigger @self.
    #
    # `Gtk::AlternativeTrigger#first` will return
    # the other one.
    def second : Gtk::ShortcutTrigger
      # gtk_alternative_trigger_get_second: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_alternative_trigger_get_second(@pointer)

      # Return value handling

      Gtk::ShortcutTrigger.new(_retval, GICrystal::Transfer::None)
    end
  end
end
