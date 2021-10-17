require "./combo_box"
require "./accessible"

require "./buildable"

require "./cell_editable"

require "./cell_layout"

require "./constraint_target"

module Gtk
  # A `GtkComboBoxText` is a simple variant of `GtkComboBox` for text-only
  # use cases.
  #
  # ![An example GtkComboBoxText](combo-box-text.png)
  #
  # `GtkComboBoxText` hides the model-view complexity of `GtkComboBox`.
  #
  # To create a `GtkComboBoxText`, use [ctor@Gtk.ComboBoxText.new] or
  # [ctor@Gtk.ComboBoxText.new_with_entry].
  #
  # You can add items to a `GtkComboBoxText` with
  # [method@Gtk.ComboBoxText.append_text],
  # [method@Gtk.ComboBoxText.insert_text] or
  # [method@Gtk.ComboBoxText.prepend_text] and remove options with
  # [method@Gtk.ComboBoxText.remove].
  #
  # If the `GtkComboBoxText` contains an entry (via the
  # [property@Gtk.ComboBox:has-entry] property), its contents can be retrieved
  # using [method@Gtk.ComboBoxText.get_active_text].
  #
  # You should not call [method@Gtk.ComboBox.set_model] or attempt to pack more
  # cells into this combo box via its [iface@Gtk.CellLayout] interface.
  #
  # # GtkComboBoxText as GtkBuildable
  #
  # The `GtkComboBoxText` implementation of the `GtkBuildable` interface supports
  # adding items directly using the <items> element and specifying <item>
  # elements for each item. Each <item> element can specify the “id”
  # corresponding to the appended text and also supports the regular
  # translation attributes “translatable”, “context” and “comments”.
  #
  # Here is a UI definition fragment specifying `GtkComboBoxText` items:
  # ```xml
  # <object class="GtkComboBoxText">
  #   <items>
  #     <item translatable="yes" id="factory">Factory</item>
  #     <item translatable="yes" id="home">Home</item>
  #     <item translatable="yes" id="subway">Subway</item>
  #   </items>
  # </object>
  # ```
  #
  # # CSS nodes
  #
  # ```
  # combobox
  # ╰── box.linked
  # ├── entry.combo
  # ├── button.combo
  # ╰── window.popup
  # ```
  #
  # `GtkComboBoxText` has a single CSS node with name combobox. It adds
  # the style class .combo to the main CSS nodes of its entry and button
  # children, and the .linked class to the node of its internal box.
  class ComboBoxText < ComboBox
    include Accessible
    include Buildable
    include CellEditable
    include CellLayout
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, active : Int32? = nil, active_id : ::String? = nil, button_sensitivity : Gtk::SensitivityType? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, editing_canceled : Bool? = nil, entry_text_column : Int32? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_entry : Bool? = nil, has_focus : Bool? = nil, has_frame : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, id_column : Int32? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, model : Gtk::TreeModel? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, popup_fixed_width : Bool? = nil, popup_shown : Bool? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[47]
      _values = StaticArray(LibGObject::Value, 47).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if active
        (_names.to_unsafe + _n).value = "active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active)
        _n += 1
      end
      if active_id
        (_names.to_unsafe + _n).value = "active-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active_id)
        _n += 1
      end
      if button_sensitivity
        (_names.to_unsafe + _n).value = "button-sensitivity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, button_sensitivity)
        _n += 1
      end
      if can_focus
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if can_target
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if child
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if css_classes
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if css_name
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if cursor
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if editing_canceled
        (_names.to_unsafe + _n).value = "editing-canceled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editing_canceled)
        _n += 1
      end
      if entry_text_column
        (_names.to_unsafe + _n).value = "entry-text-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, entry_text_column)
        _n += 1
      end
      if focus_on_click
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if focusable
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if halign
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if has_default
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if has_entry
        (_names.to_unsafe + _n).value = "has-entry".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_entry)
        _n += 1
      end
      if has_focus
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if has_frame
        (_names.to_unsafe + _n).value = "has-frame".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_frame)
        _n += 1
      end
      if has_tooltip
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if height_request
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if hexpand
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if hexpand_set
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if id_column
        (_names.to_unsafe + _n).value = "id-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, id_column)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if margin_bottom
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if margin_end
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if margin_start
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if margin_top
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
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
      if opacity
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if overflow
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if popup_fixed_width
        (_names.to_unsafe + _n).value = "popup-fixed-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, popup_fixed_width)
        _n += 1
      end
      if popup_shown
        (_names.to_unsafe + _n).value = "popup-shown".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, popup_shown)
        _n += 1
      end
      if receives_default
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if root
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if scale_factor
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if tooltip_markup
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if tooltip_text
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if valign
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if vexpand
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if vexpand_set
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ComboBoxText.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_combo_box_text_get_type
    end

    def initialize
      # gtk_combo_box_text_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_text_new
      @pointer = _retval
    end

    def self.new_with_entry : Gtk::Widget
      # gtk_combo_box_text_new_with_entry: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_text_new_with_entry
      Gtk::ComboBoxText.new(_retval, GICrystal::Transfer::Full)
    end

    def append(id : ::String?, text : ::String) : Nil
      # gtk_combo_box_text_append: (Method)
      # @id: (nullable)
      # Returns: (transfer none)

      id = if id.nil?
             Pointer(LibC::Char).null
           else
             id.to_unsafe
           end

      LibGtk.gtk_combo_box_text_append(self, id, text)
    end

    def append_text(text : ::String) : Nil
      # gtk_combo_box_text_append_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_text_append_text(self, text)
    end

    def active_text : ::String?
      # gtk_combo_box_text_get_active_text: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_combo_box_text_get_active_text(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def insert(position : Int32, id : ::String?, text : ::String) : Nil
      # gtk_combo_box_text_insert: (Method)
      # @id: (nullable)
      # Returns: (transfer none)

      id = if id.nil?
             Pointer(LibC::Char).null
           else
             id.to_unsafe
           end

      LibGtk.gtk_combo_box_text_insert(self, position, id, text)
    end

    def insert_text(position : Int32, text : ::String) : Nil
      # gtk_combo_box_text_insert_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_text_insert_text(self, position, text)
    end

    def prepend(id : ::String?, text : ::String) : Nil
      # gtk_combo_box_text_prepend: (Method)
      # @id: (nullable)
      # Returns: (transfer none)

      id = if id.nil?
             Pointer(LibC::Char).null
           else
             id.to_unsafe
           end

      LibGtk.gtk_combo_box_text_prepend(self, id, text)
    end

    def prepend_text(text : ::String) : Nil
      # gtk_combo_box_text_prepend_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_text_prepend_text(self, text)
    end

    def remove(position : Int32) : Nil
      # gtk_combo_box_text_remove: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_text_remove(self, position)
    end

    def remove_all : Nil
      # gtk_combo_box_text_remove_all: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_text_remove_all(self)
    end
  end
end