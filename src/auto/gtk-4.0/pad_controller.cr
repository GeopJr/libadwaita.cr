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
  # [iface@Gio.Action] objects, thus letting the application give them a more
  # semantic meaning.
  #
  # Buttons and sensors are not constrained to triggering a single action,
  # some %GDK_SOURCE_TABLET_PAD devices feature multiple "modes". All these
  # input elements have one current mode, which may determine the final action
  # being triggered.
  #
  # Pad devices often divide buttons and sensors into groups. All elements
  # in a group share the same current mode, but different groups may have
  # different modes. See [method@Gdk.DevicePad.get_n_groups] and
  # [method@Gdk.DevicePad.get_group_n_modes].
  #
  # Each of the actions that a given button/strip/ring performs for a given mode
  # is defined by a [struct@Gtk.PadActionEntry]. It contains an action name that
  # will be looked up in the given [iface@Gio.ActionGroup] and activated whenever
  # the specified input element and mode are triggered.
  #
  # A simple example of `GtkPadController` usage: Assigning button 1 in all
  # modes and pad devices to an "invert-selection" action:
  #
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
  class PadController < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, action_group : Gio::ActionGroup? = nil, name : ::String? = nil, pad : Gdk::Device? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if action_group
        (_names.to_unsafe + _n).value = "action-group".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_group)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if pad
        (_names.to_unsafe + _n).value = "pad".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pad)
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

      @pointer = LibGObject.g_object_new_with_properties(PadController.g_type, _n, _names, _values)
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

    def initialize(group : Gio::ActionGroup, pad : Gdk::Device?)
      # gtk_pad_controller_new: (Constructor)
      # @pad: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      pad = if pad.nil?
              Pointer(Void).null
            else
              pad.to_unsafe
            end

      # C call
      _retval = LibGtk.gtk_pad_controller_new(group, pad)

      # Return value handling
      @pointer = _retval
    end

    def set_action(type : Gtk::PadActionType, index : Int32, mode : Int32, label : ::String, action_name : ::String) : Nil
      # gtk_pad_controller_set_action: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_pad_controller_set_action(self, type, index, mode, label, action_name)

      # Return value handling
    end

    def set_action_entries(entries : Enumerable(Gtk::PadActionEntry)) : Nil
      # gtk_pad_controller_set_action_entries: (Method)
      # @entries: (array length=n_entries element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      n_entries = entries.size
      entries = entries.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_pad_controller_set_action_entries(self, entries, n_entries)

      # Return value handling
    end

    def set_action_entries(*entries : Gtk::PadActionEntry)
      set_action_entries(entries)
    end
  end
end
