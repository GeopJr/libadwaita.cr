require "./event_controller"
require "../gio-2.0/list_model"

require "./buildable"

module Gtk
  # `GtkShortcutController` is an event controller that manages shortcuts.
  #
  # Most common shortcuts are using this controller implicitly, e.g. by
  # adding a mnemonic underline to a `GtkLabel`, or by installing a key
  # binding using [method@Gtk.WidgetClass.add_binding], or by adding accelerators
  # to global actions using [method@Gtk.Application.set_accels_for_action].
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
  # This example creates a [class@Gtk.ActivateAction] for triggering the
  # `activate` signal of the `GtkButton`. See [ctor@Gtk.ShortcutAction.parse_string]
  # for the syntax for other kinds of `GtkShortcutAction`. See
  # [ctor@Gtk.ShortcutTrigger.parse_string] to learn more about the syntax
  # for triggers.
  class ShortcutController < EventController
    include Gio::ListModel
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, mnemonic_modifiers : Gdk::ModifierType? = nil, model : Gio::ListModel? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, scope : Gtk::ShortcutScope? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[7]
      _values = StaticArray(LibGObject::Value, 7).new(LibGObject::Value.new)
      _n = 0

      if mnemonic_modifiers
        (_names.to_unsafe + _n).value = "mnemonic-modifiers".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonic_modifiers)
        _n += 1
      end
      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
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
      if scope
        (_names.to_unsafe + _n).value = "scope".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scope)
        _n += 1
      end
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ShortcutController.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_shortcut_controller_get_type
    end

    def model=(value : ListModel?) : ListModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize
      # gtk_shortcut_controller_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_shortcut_controller_new
      @pointer = _retval
    end

    def self.new_for_model(model : Gio::ListModel) : Gtk::EventController
      # gtk_shortcut_controller_new_for_model: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_shortcut_controller_new_for_model(model)
      Gtk::ShortcutController.new(_retval, GICrystal::Transfer::Full)
    end

    def add_shortcut(shortcut : Gtk::Shortcut) : Nil
      # gtk_shortcut_controller_add_shortcut: (Method)
      # @shortcut: (transfer full)
      # Returns: (transfer none)

      LibGObject.g_object_ref(shortcut)

      LibGtk.gtk_shortcut_controller_add_shortcut(self, shortcut)
    end

    def mnemonics_modifiers : Gdk::ModifierType
      # gtk_shortcut_controller_get_mnemonics_modifiers: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_shortcut_controller_get_mnemonics_modifiers(self)
      Gdk::ModifierType.from_value(_retval)
    end

    def scope : Gtk::ShortcutScope
      # gtk_shortcut_controller_get_scope: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_shortcut_controller_get_scope(self)
      Gtk::ShortcutScope.from_value(_retval)
    end

    def remove_shortcut(shortcut : Gtk::Shortcut) : Nil
      # gtk_shortcut_controller_remove_shortcut: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_shortcut_controller_remove_shortcut(self, shortcut)
    end

    def mnemonics_modifiers=(modifiers : Gdk::ModifierType) : Nil
      # gtk_shortcut_controller_set_mnemonics_modifiers: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_shortcut_controller_set_mnemonics_modifiers(self, modifiers)
    end

    def scope=(scope : Gtk::ShortcutScope) : Nil
      # gtk_shortcut_controller_set_scope: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_shortcut_controller_set_scope(self, scope)
    end
  end
end
