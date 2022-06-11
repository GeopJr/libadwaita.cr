require "./event_controller"
require "../gio-2.0/list_model"

require "./buildable"

module Gtk
  # `GtkShortcutController` is an event controller that manages shortcuts.
  #
  # Most common shortcuts are using this controller implicitly, e.g. by
  # adding a mnemonic underline to a `GtkLabel`, or by installing a key
  # binding using `Gtk::WidgetClass#add_binding`, or by adding accelerators
  # to global actions using `Gtk::Application#accels_for_action=`.
  #
  # But it is possible to create your own shortcut controller, and add
  # shortcuts to it.
  #
  # `GtkShortcutController` implements `GListModel` for querying the
  # shortcuts that have been added to it.
  #
  # # GtkShortcutController as a GtkBuildable
  #
  # `GtkShortcutControllers` can be creates in ui files to set up
  # shortcuts in the same place as the widgets.
  #
  # An example of a UI definition fragment with `GtkShortcutController`:
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  #   <object class='GtkButton'>
  #     <child>
  #       <object class='GtkShortcutController'>
  #         <property name='scope'>managed</property>
  #         <child>
  #           <object class='GtkShortcut'>
  #             <property name='trigger'>&lt;Control&gt;k</property>
  #             <property name='action'>activate</property>
  #           </object>
  #         </child>
  #       </object>
  #     </child>
  #   </object>
  # ```
  #
  # This example creates a `Gtk#ActivateAction` for triggering the
  # `activate` signal of the `GtkButton`. See `Gtk::ShortcutAction#parse_string`
  # for the syntax for other kinds of `GtkShortcutAction`. See
  # `Gtk::ShortcutTrigger#parse_string` to learn more about the syntax
  # for triggers.
  @[GObject::GeneratedWrapper]
  class ShortcutController < EventController
    include Gio::ListModel
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ShortcutControllerClass), class_init,
        sizeof(LibGtk::ShortcutController), instance_init, 0)
    end

    GICrystal.define_new_method(ShortcutController, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ShortcutController`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, mnemonic_modifiers : Gdk::ModifierType? = nil, model : Gio::ListModel? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, scope : Gtk::ShortcutScope? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[7]
      _values = StaticArray(LibGObject::Value, 7).new(LibGObject::Value.new)
      _n = 0

      if !mnemonic_modifiers.nil?
        (_names.to_unsafe + _n).value = "mnemonic-modifiers".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonic_modifiers)
        _n += 1
      end
      if !model.nil?
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
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
      if !scope.nil?
        (_names.to_unsafe + _n).value = "scope".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scope)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ShortcutController.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_shortcut_controller_get_type
    end

    def mnemonic_modifiers=(value : Gdk::ModifierType) : Gdk::ModifierType
      unsafe_value = value

      LibGObject.g_object_set(self, "mnemonic-modifiers", unsafe_value, Pointer(Void).null)
      value
    end

    def mnemonic_modifiers : Gdk::ModifierType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "mnemonic-modifiers", pointerof(value), Pointer(Void).null)
      Gdk::ModifierType.new(value)
    end

    def model=(value : Gio::ListModel?) : Gio::ListModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def scope=(value : Gtk::ShortcutScope) : Gtk::ShortcutScope
      unsafe_value = value

      LibGObject.g_object_set(self, "scope", unsafe_value, Pointer(Void).null)
      value
    end

    def scope : Gtk::ShortcutScope
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "scope", pointerof(value), Pointer(Void).null)
      Gtk::ShortcutScope.new(value)
    end

    # Creates a new shortcut controller that takes its shortcuts from
    # the given list model.
    #
    # A controller created by this function does not let you add or
    # remove individual shortcuts using the shortcut controller api,
    # but you can change the contents of the model.
    def self.new_for_model(model : Gio::ListModel) : self
      # gtk_shortcut_controller_new_for_model: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_shortcut_controller_new_for_model(model)

      # Return value handling

      Gtk::ShortcutController.new(_retval, GICrystal::Transfer::Full)
    end

    # Adds @shortcut to the list of shortcuts handled by @self.
    #
    # If this controller uses an external shortcut list, this
    # function does nothing.
    def add_shortcut(shortcut : Gtk::Shortcut) : Nil
      # gtk_shortcut_controller_add_shortcut: (Method)
      # @shortcut: (transfer full)
      # Returns: (transfer none)

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(shortcut)
      # C call
      LibGtk.gtk_shortcut_controller_add_shortcut(@pointer, shortcut)

      # Return value handling
    end

    # Gets the mnemonics modifiers for when this controller activates its shortcuts.
    def mnemonics_modifiers : Gdk::ModifierType
      # gtk_shortcut_controller_get_mnemonics_modifiers: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_shortcut_controller_get_mnemonics_modifiers(@pointer)

      # Return value handling

      Gdk::ModifierType.new(_retval)
    end

    # Gets the scope for when this controller activates its shortcuts.
    #
    # See `Gtk::ShortcutController#scope=` for details.
    def scope : Gtk::ShortcutScope
      # gtk_shortcut_controller_get_scope: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_shortcut_controller_get_scope(@pointer)

      # Return value handling

      Gtk::ShortcutScope.new(_retval)
    end

    # Removes @shortcut from the list of shortcuts handled by @self.
    #
    # If @shortcut had not been added to @controller or this controller
    # uses an external shortcut list, this function does nothing.
    def remove_shortcut(shortcut : Gtk::Shortcut) : Nil
      # gtk_shortcut_controller_remove_shortcut: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_shortcut_controller_remove_shortcut(@pointer, shortcut)

      # Return value handling
    end

    # Sets the controller to use the given modifier for mnemonics.
    #
    # The mnemonics modifiers determines which modifiers need to be pressed to allow
    # activation of shortcuts with mnemonics triggers.
    #
    # GTK normally uses the Alt modifier for mnemonics, except in `GtkPopoverMenu`s,
    # where mnemonics can be triggered without any modifiers. It should be very
    # rarely necessary to change this, and doing so is likely to interfere with
    # other shortcuts.
    #
    # This value is only relevant for local shortcut controllers. Global and managed
    # shortcut controllers will have their shortcuts activated from other places which
    # have their own modifiers for activating mnemonics.
    def mnemonics_modifiers=(modifiers : Gdk::ModifierType) : Nil
      # gtk_shortcut_controller_set_mnemonics_modifiers: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_shortcut_controller_set_mnemonics_modifiers(@pointer, modifiers)

      # Return value handling
    end

    # Sets the controller to have the given @scope.
    #
    # The scope allows shortcuts to be activated outside of the normal
    # event propagation. In particular, it allows installing global
    # keyboard shortcuts that can be activated even when a widget does
    # not have focus.
    #
    # With %GTK_SHORTCUT_SCOPE_LOCAL, shortcuts will only be activated
    # when the widget has focus.
    def scope=(scope : Gtk::ShortcutScope) : Nil
      # gtk_shortcut_controller_set_scope: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_shortcut_controller_set_scope(@pointer, scope)

      # Return value handling
    end
  end
end
