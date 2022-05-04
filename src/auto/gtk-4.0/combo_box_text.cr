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
  # To create a `GtkComboBoxText`, use `Gtk::ComboBoxText.new` or
  # `Gtk::ComboBoxText#new_with_entry`.
  #
  # You can add items to a `GtkComboBoxText` with
  # `Gtk::ComboBoxText#append_text`,
  # `Gtk::ComboBoxText#insert_text` or
  # `Gtk::ComboBoxText#prepend_text` and remove options with
  # `Gtk::ComboBoxText#remove`.
  #
  # If the `GtkComboBoxText` contains an entry (via the
  # [property@Gtk.ComboBox:has-entry] property), its contents can be retrieved
  # using `Gtk::ComboBoxText#active_text`.
  #
  # You should not call `Gtk::ComboBox#model=` or attempt to pack more
  # cells into this combo box via its `Gtk#CellLayout` interface.
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
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
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
  @[GObject::GeneratedWrapper]
  class ComboBoxText < ComboBox
    include Accessible
    include Buildable
    include CellEditable
    include CellLayout
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::ComboBoxText), instance_init, 0)
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

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, active : Int32? = nil, active_id : ::String? = nil, button_sensitivity : Gtk::SensitivityType? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, editing_canceled : Bool? = nil, entry_text_column : Int32? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_entry : Bool? = nil, has_focus : Bool? = nil, has_frame : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, id_column : Int32? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, model : Gtk::TreeModel? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, popup_fixed_width : Bool? = nil, popup_shown : Bool? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[47]
      _values = StaticArray(LibGObject::Value, 47).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !active.nil?
        (_names.to_unsafe + _n).value = "active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active)
        _n += 1
      end
      if !active_id.nil?
        (_names.to_unsafe + _n).value = "active-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active_id)
        _n += 1
      end
      if !button_sensitivity.nil?
        (_names.to_unsafe + _n).value = "button-sensitivity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, button_sensitivity)
        _n += 1
      end
      if !can_focus.nil?
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if !can_target.nil?
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if !child.nil?
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if !css_classes.nil?
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if !css_name.nil?
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if !cursor.nil?
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if !editing_canceled.nil?
        (_names.to_unsafe + _n).value = "editing-canceled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editing_canceled)
        _n += 1
      end
      if !entry_text_column.nil?
        (_names.to_unsafe + _n).value = "entry-text-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, entry_text_column)
        _n += 1
      end
      if !focus_on_click.nil?
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if !focusable.nil?
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if !halign.nil?
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if !has_default.nil?
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if !has_entry.nil?
        (_names.to_unsafe + _n).value = "has-entry".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_entry)
        _n += 1
      end
      if !has_focus.nil?
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if !has_frame.nil?
        (_names.to_unsafe + _n).value = "has-frame".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_frame)
        _n += 1
      end
      if !has_tooltip.nil?
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if !height_request.nil?
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if !hexpand.nil?
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if !hexpand_set.nil?
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if !id_column.nil?
        (_names.to_unsafe + _n).value = "id-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, id_column)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !margin_bottom.nil?
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if !margin_end.nil?
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if !margin_start.nil?
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if !margin_top.nil?
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
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
      if !opacity.nil?
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if !overflow.nil?
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !popup_fixed_width.nil?
        (_names.to_unsafe + _n).value = "popup-fixed-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, popup_fixed_width)
        _n += 1
      end
      if !popup_shown.nil?
        (_names.to_unsafe + _n).value = "popup-shown".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, popup_shown)
        _n += 1
      end
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !root.nil?
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if !scale_factor.nil?
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !tooltip_markup.nil?
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if !tooltip_text.nil?
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if !valign.nil?
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if !vexpand.nil?
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if !vexpand_set.nil?
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ComboBoxText.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_combo_box_text_get_type
    end

    # Creates a new `GtkComboBoxText`.
    def initialize
      # gtk_combo_box_text_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_text_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new `GtkComboBoxText` with an entry.
    def self.new_with_entry : self
      # gtk_combo_box_text_new_with_entry: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_text_new_with_entry

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::ComboBoxText.new(_retval, GICrystal::Transfer::Full)
    end

    # Appends @text to the list of strings stored in @combo_box.
    #
    # If @id is non-%NULL then it is used as the ID of the row.
    #
    # This is the same as calling `Gtk::ComboBoxText#insert`
    # with a position of -1.
    def append(id : ::String?, text : ::String) : Nil
      # gtk_combo_box_text_append: (Method)
      # @id: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      id = if id.nil?
             Pointer(LibC::Char).null
           else
             id.to_unsafe
           end

      # C call
      LibGtk.gtk_combo_box_text_append(self, id, text)

      # Return value handling
    end

    # Appends @text to the list of strings stored in @combo_box.
    #
    # This is the same as calling `Gtk::ComboBoxText#insert_text`
    # with a position of -1.
    def append_text(text : ::String) : Nil
      # gtk_combo_box_text_append_text: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_text_append_text(self, text)

      # Return value handling
    end

    # Returns the currently active string in @combo_box.
    #
    # If no row is currently selected, %NULL is returned.
    # If @combo_box contains an entry, this function will
    # return its contents (which will not necessarily
    # be an item from the list).
    def active_text : ::String?
      # gtk_combo_box_text_get_active_text: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_combo_box_text_get_active_text(self)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Inserts @text at @position in the list of strings stored in @combo_box.
    #
    # If @id is non-%NULL then it is used as the ID of the row.
    # See [property@Gtk.ComboBox:id-column].
    #
    # If @position is negative then @text is appended.
    def insert(position : Int32, id : ::String?, text : ::String) : Nil
      # gtk_combo_box_text_insert: (Method)
      # @id: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      id = if id.nil?
             Pointer(LibC::Char).null
           else
             id.to_unsafe
           end

      # C call
      LibGtk.gtk_combo_box_text_insert(self, position, id, text)

      # Return value handling
    end

    # Inserts @text at @position in the list of strings stored in @combo_box.
    #
    # If @position is negative then @text is appended.
    #
    # This is the same as calling `Gtk::ComboBoxText#insert`
    # with a %NULL ID string.
    def insert_text(position : Int32, text : ::String) : Nil
      # gtk_combo_box_text_insert_text: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_text_insert_text(self, position, text)

      # Return value handling
    end

    # Prepends @text to the list of strings stored in @combo_box.
    #
    # If @id is non-%NULL then it is used as the ID of the row.
    #
    # This is the same as calling `Gtk::ComboBoxText#insert`
    # with a position of 0.
    def prepend(id : ::String?, text : ::String) : Nil
      # gtk_combo_box_text_prepend: (Method)
      # @id: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      id = if id.nil?
             Pointer(LibC::Char).null
           else
             id.to_unsafe
           end

      # C call
      LibGtk.gtk_combo_box_text_prepend(self, id, text)

      # Return value handling
    end

    # Prepends @text to the list of strings stored in @combo_box.
    #
    # This is the same as calling `Gtk::ComboBoxText#insert_text`
    # with a position of 0.
    def prepend_text(text : ::String) : Nil
      # gtk_combo_box_text_prepend_text: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_text_prepend_text(self, text)

      # Return value handling
    end

    # Removes the string at @position from @combo_box.
    def remove(position : Int32) : Nil
      # gtk_combo_box_text_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_text_remove(self, position)

      # Return value handling
    end

    # Removes all the text entries from the combo box.
    def remove_all : Nil
      # gtk_combo_box_text_remove_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_text_remove_all(self)

      # Return value handling
    end
  end
end
