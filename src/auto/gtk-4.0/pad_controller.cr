require "./event_controller"

module Gtk
  # `GtkPadController` is an event controller for the pads found in drawing
  # tablets.
  #
  # Pads are the collection of buttons and tactile sensors often found around
  # the stylus-sensitive area.
  #
  # These buttons and sensors have no implicit meaning, and by default they
  # perform no action. `GtkPadController` is provided to map those to
  # `Gio#Action` objects, thus letting the application give them a more
  # semantic meaning.
  #
  # Buttons and sensors are not constrained to triggering a single action,
  # some %GDK_SOURCE_TABLET_PAD devices feature multiple "modes". All these
  # input elements have one current mode, which may determine the final action
  # being triggered.
  #
  # Pad devices often divide buttons and sensors into groups. All elements
  # in a group share the same current mode, but different groups may have
  # different modes. See `Gdk::DevicePad#n_groups` and
  # `Gdk::DevicePad#group_n_modes`.
  #
  # Each of the actions that a given button/strip/ring performs for a given mode
  # is defined by a `Gtk#PadActionEntry`. It contains an action name that
  # will be looked up in the given `Gio#ActionGroup` and activated whenever
  # the specified input element and mode are triggered.
  #
  # A simple example of `GtkPadController` usage: Assigning button 1 in all
  # modes and pad devices to an "invert-selection" action:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # GtkPadActionEntry *pad_actions[] = {
  #   { GTK_PAD_ACTION_BUTTON, 1, -1, "Invert selection", "pad-actions.invert-selection" },
  #   …
  # };
  #
  # …
  # action_group = g_simple_action_group_new ();
  # action = g_simple_action_new ("pad-actions.invert-selection", NULL);
  # g_signal_connect (action, "activate", on_invert_selection_activated, NULL);
  # g_action_map_add_action (G_ACTION_MAP (action_group), action);
  # …
  # pad_controller = gtk_pad_controller_new (action_group, NULL);
  # ```
  #
  # The actions belonging to rings/strips will be activated with a parameter
  # of type %G_VARIANT_TYPE_DOUBLE bearing the value of the given axis, it
  # is required that those are made stateful and accepting this `GVariantType`.
  @[GObject::GeneratedWrapper]
  class PadController < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::PadControllerClass), class_init,
        sizeof(LibGtk::PadController), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, action_group : Gio::ActionGroup? = nil, name : ::String? = nil, pad : Gdk::Device? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if !action_group.nil?
        (_names.to_unsafe + _n).value = "action-group".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_group)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !pad.nil?
        (_names.to_unsafe + _n).value = "pad".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pad)
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

      @pointer = LibGObject.g_object_new_with_properties(PadController.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_pad_controller_get_type
    end

    def action_group=(value : Gio::ActionGroup?) : Gio::ActionGroup?
      unsafe_value = value

      LibGObject.g_object_set(self, "action-group", unsafe_value, Pointer(Void).null)
      value
    end

    def action_group : Gio::ActionGroup?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "action-group", pointerof(value), Pointer(Void).null)
      Gio::ActionGroup__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def pad=(value : Gdk::Device?) : Gdk::Device?
      unsafe_value = value

      LibGObject.g_object_set(self, "pad", unsafe_value, Pointer(Void).null)
      value
    end

    def pad : Gdk::Device?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pad", pointerof(value), Pointer(Void).null)
      Gdk::Device.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `GtkPadController` that will associate events from @pad to
    # actions.
    #
    # A %NULL pad may be provided so the controller manages all pad devices
    # generically, it is discouraged to mix `GtkPadController` objects with
    # %NULL and non-%NULL @pad argument on the same toplevel window, as execution
    # order is not guaranteed.
    #
    # The `GtkPadController` is created with no mapped actions. In order to
    # map pad events to actions, use `Gtk::PadController#action_entries=`
    # or `Gtk::PadController#action=`.
    #
    # Be aware that pad events will only be delivered to `GtkWindow`s, so adding
    # a pad controller to any other type of widget will not have an effect.
    def initialize(group : Gio::ActionGroup, pad : Gdk::Device?)
      # gtk_pad_controller_new: (Constructor)
      # @pad: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      pad = if pad.nil?
              Pointer(Void).null
            else
              pad.to_unsafe
            end

      # C call
      _retval = LibGtk.gtk_pad_controller_new(group, pad)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds an individual action to @controller.
    #
    # This action will only be activated if the given button/ring/strip number
    # in @index is interacted while the current mode is @mode. -1 may be used
    # for simple cases, so the action is triggered on all modes.
    #
    # The given @label should be considered user-visible, so internationalization
    # rules apply. Some windowing systems may be able to use those for user
    # feedback.
    def set_action(type : Gtk::PadActionType, index : Int32, mode : Int32, label : ::String, action_name : ::String) : Nil
      # gtk_pad_controller_set_action: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_pad_controller_set_action(self, type, index, mode, label, action_name)

      # Return value handling
    end

    # A convenience function to add a group of action entries on
    # @controller.
    #
    # See `Gtk#PadActionEntry` and `Gtk::PadController#action=`.
    def action_entries=(entries : Enumerable(Gtk::PadActionEntry)) : Nil
      # gtk_pad_controller_set_action_entries: (Method)
      # @entries: (array length=n_entries element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_entries = entries.size # Generator::ArrayArgPlan
      entries = entries.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_pad_controller_set_action_entries(self, entries, n_entries)

      # Return value handling
    end
  end
end
