require "./widget"
require "./accessible"

require "./buildable"

require "./cell_editable"

require "./cell_layout"

require "./constraint_target"

module Gtk
  # A `GtkComboBox` is a widget that allows the user to choose from a list of
  # valid choices.
  #
  # ![An example GtkComboBox](combo-box.png)
  #
  # The `GtkComboBox` displays the selected choice; when activated, the
  # `GtkComboBox` displays a popup which allows the user to make a new choice.
  #
  # The `GtkComboBox` uses the model-view pattern; the list of valid choices
  # is specified in the form of a tree model, and the display of the choices
  # can be adapted to the data in the model by using cell renderers, as you
  # would in a tree view. This is possible since `GtkComboBox` implements the
  # `Gtk#CellLayout` interface. The tree model holding the valid
  # choices is not restricted to a flat list, it can be a real tree, and the
  # popup will reflect the tree structure.
  #
  # To allow the user to enter values not in the model, the
  # [property@Gtk.ComboBox:has-entry] property allows the `GtkComboBox` to
  # contain a `Gtk#Entry`. This entry can be accessed by calling
  # `Gtk::ComboBox#child` on the combo box.
  #
  # For a simple list of textual choices, the model-view API of `GtkComboBox`
  # can be a bit overwhelming. In this case, `Gtk#ComboBoxText` offers
  # a simple alternative. Both `GtkComboBox` and `GtkComboBoxText` can contain
  # an entry.
  #
  # ## CSS nodes
  #
  # ```
  # combobox
  # ├── box.linked
  # │ ╰── button.combo
  # │ ╰── box
  # │ ├── cellview
  # │ ╰── arrow
  # ╰── window.popup
  # ```
  #
  # A normal combobox contains a box with the .linked class, a button
  # with the .combo class and inside those buttons, there are a cellview and
  # an arrow.
  #
  # ```
  # combobox
  # ├── box.linked
  # │ ├── entry.combo
  # │ ╰── button.combo
  # │ ╰── box
  # │ ╰── arrow
  # ╰── window.popup
  # ```
  #
  # A `GtkComboBox` with an entry has a single CSS node with name combobox.
  # It contains a box with the .linked class. That box contains an entry and
  # a button, both with the .combo class added. The button also contains another
  # node with name arrow.
  #
  # # Accessibility
  #
  # `GtkComboBox` uses the %GTK_ACCESSIBLE_ROLE_COMBO_BOX role.
  @[GObject::GeneratedWrapper]
  class ComboBox < Widget
    include Accessible
    include Buildable
    include CellEditable
    include CellLayout
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ComboBoxClass), class_init,
        sizeof(LibGtk::ComboBox), instance_init, 0)
    end

    GICrystal.define_new_method(ComboBox, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ComboBox`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

      @pointer = LibGObject.g_object_new_with_properties(ComboBox.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_combo_box_get_type
    end

    def active=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "active", unsafe_value, Pointer(Void).null)
      value
    end

    def active : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "active", pointerof(value), Pointer(Void).null)
      value
    end

    def active_id=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "active-id", unsafe_value, Pointer(Void).null)
      value
    end

    def active_id : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "active-id", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def button_sensitivity=(value : Gtk::SensitivityType) : Gtk::SensitivityType
      unsafe_value = value

      LibGObject.g_object_set(self, "button-sensitivity", unsafe_value, Pointer(Void).null)
      value
    end

    def button_sensitivity : Gtk::SensitivityType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "button-sensitivity", pointerof(value), Pointer(Void).null)
      Gtk::SensitivityType.new(value)
    end

    def child=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "child", unsafe_value, Pointer(Void).null)
      value
    end

    def child : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "child", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def entry_text_column=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "entry-text-column", unsafe_value, Pointer(Void).null)
      value
    end

    def entry_text_column : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "entry-text-column", pointerof(value), Pointer(Void).null)
      value
    end

    def has_entry=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-entry", unsafe_value, Pointer(Void).null)
      value
    end

    def has_entry? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-entry", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def has_frame=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-frame", unsafe_value, Pointer(Void).null)
      value
    end

    def has_frame? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-frame", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def id_column=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "id-column", unsafe_value, Pointer(Void).null)
      value
    end

    def id_column : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "id-column", pointerof(value), Pointer(Void).null)
      value
    end

    def model=(value : Gtk::TreeModel?) : Gtk::TreeModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def model : Gtk::TreeModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "model", pointerof(value), Pointer(Void).null)
      Gtk::AbstractTreeModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def popup_fixed_width=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "popup-fixed-width", unsafe_value, Pointer(Void).null)
      value
    end

    def popup_fixed_width? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "popup-fixed-width", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def popup_shown? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "popup-shown", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new empty `GtkComboBox`.
    def initialize
      # gtk_combo_box_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new empty `GtkComboBox` with an entry.
    #
    # In order to use a combo box with entry, you need to tell it
    # which column of the model contains the text for the entry
    # by calling `Gtk::ComboBox#entry_text_column=`.
    def self.new_with_entry : self
      # gtk_combo_box_new_with_entry: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_new_with_entry

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::ComboBox.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new `GtkComboBox` with a model.
    def self.new_with_model(model : Gtk::TreeModel) : self
      # gtk_combo_box_new_with_model: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_new_with_model(model)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::ComboBox.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new empty `GtkComboBox` with an entry and a model.
    #
    # See also `Gtk::ComboBox#new_with_entry`.
    def self.new_with_model_and_entry(model : Gtk::TreeModel) : self
      # gtk_combo_box_new_with_model_and_entry: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_new_with_model_and_entry(model)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::ComboBox.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns the index of the currently active item.
    #
    # If the model is a non-flat treemodel, and the active item is not
    # an immediate child of the root of the tree, this function returns
    # `gtk_tree_path_get_indices (path)[0]`, where `path` is the
    # `Gtk#TreePath` of the active item.
    def active : Int32
      # gtk_combo_box_get_active: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_get_active(@pointer)

      # Return value handling

      _retval
    end

    # Returns the ID of the active row of @combo_box.
    #
    # This value is taken from the active row and the column specified
    # by the [property@Gtk.ComboBox:id-column] property of @combo_box
    # (see `Gtk::ComboBox#id_column=`).
    #
    # The returned value is an interned string which means that you can
    # compare the pointer by value to other interned strings and that you
    # must not free it.
    #
    # If the [property@Gtk.ComboBox:id-column] property of @combo_box is
    # not set, or if no row is active, or if the active row has a %NULL
    # ID value, then %NULL is returned.
    def active_id : ::String?
      # gtk_combo_box_get_active_id: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_get_active_id(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Sets @iter to point to the currently active item.
    #
    # If no item is active, @iter is left unchanged.
    def active_iter : Gtk::TreeIter
      # gtk_combo_box_get_active_iter: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new
      # C call
      _retval = LibGtk.gtk_combo_box_get_active_iter(@pointer, iter)

      # Return value handling

      iter
    end

    # Returns whether the combo box sets the dropdown button
    # sensitive or not when there are no items in the model.
    def button_sensitivity : Gtk::SensitivityType
      # gtk_combo_box_get_button_sensitivity: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_get_button_sensitivity(@pointer)

      # Return value handling

      Gtk::SensitivityType.new(_retval)
    end

    # Gets the child widget of @combo_box.
    def child : Gtk::Widget?
      # gtk_combo_box_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the column which @combo_box is using to get the strings
    # from to display in the internal entry.
    def entry_text_column : Int32
      # gtk_combo_box_get_entry_text_column: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_get_entry_text_column(@pointer)

      # Return value handling

      _retval
    end

    # Returns whether the combo box has an entry.
    def has_entry : Bool
      # gtk_combo_box_get_has_entry: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_get_has_entry(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the column which @combo_box is using to get string IDs
    # for values from.
    def id_column : Int32
      # gtk_combo_box_get_id_column: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_get_id_column(@pointer)

      # Return value handling

      _retval
    end

    # Returns the `GtkTreeModel` of @combo_box.
    def model : Gtk::TreeModel?
      # gtk_combo_box_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_get_model(@pointer)

      # Return value handling

      Gtk::AbstractTreeModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether the popup uses a fixed width.
    def popup_fixed_width : Bool
      # gtk_combo_box_get_popup_fixed_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_combo_box_get_popup_fixed_width(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Hides the menu or dropdown list of @combo_box.
    #
    # This function is mostly intended for use by accessibility technologies;
    # applications should have little use for it.
    def popdown : Nil
      # gtk_combo_box_popdown: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_popdown(@pointer)

      # Return value handling
    end

    # Pops up the menu or dropdown list of @combo_box.
    #
    # This function is mostly intended for use by accessibility technologies;
    # applications should have little use for it.
    #
    # Before calling this, @combo_box must be mapped, or nothing will happen.
    def popup : Nil
      # gtk_combo_box_popup: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_popup(@pointer)

      # Return value handling
    end

    # Pops up the menu of @combo_box.
    #
    # Note that currently this does not do anything with the device, as it was
    # previously only used for list-mode combo boxes, and those were removed
    # in GTK 4. However, it is retained in case similar functionality is added
    # back later.
    def popup_for_device(device : Gdk::Device) : Nil
      # gtk_combo_box_popup_for_device: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_popup_for_device(@pointer, device)

      # Return value handling
    end

    # Sets the active item of @combo_box to be the item at @index.
    def active=(index_ : Int32) : Nil
      # gtk_combo_box_set_active: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_set_active(@pointer, index_)

      # Return value handling
    end

    # Changes the active row of @combo_box to the one that has an ID equal to
    # @active_id.
    #
    # If @active_id is %NULL, the active row is unset. Rows having
    # a %NULL ID string cannot be made active by this function.
    #
    # If the [property@Gtk.ComboBox:id-column] property of @combo_box is
    # unset or if no row has the given ID then the function does nothing
    # and returns %FALSE.
    def active_id=(active_id : ::String?) : Bool
      # gtk_combo_box_set_active_id: (Method | Setter)
      # @active_id: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      active_id = if active_id.nil?
                    Pointer(LibC::Char).null
                  else
                    active_id.to_unsafe
                  end

      # C call
      _retval = LibGtk.gtk_combo_box_set_active_id(@pointer, active_id)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the current active item to be the one referenced by @iter.
    #
    # If @iter is %NULL, the active item is unset.
    def active_iter=(iter : Gtk::TreeIter?) : Nil
      # gtk_combo_box_set_active_iter: (Method)
      # @iter: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      iter = if iter.nil?
               Pointer(Void).null
             else
               iter.to_unsafe
             end

      # C call
      LibGtk.gtk_combo_box_set_active_iter(@pointer, iter)

      # Return value handling
    end

    # Sets whether the dropdown button of the combo box should update
    # its sensitivity depending on the model contents.
    def button_sensitivity=(sensitivity : Gtk::SensitivityType) : Nil
      # gtk_combo_box_set_button_sensitivity: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_set_button_sensitivity(@pointer, sensitivity)

      # Return value handling
    end

    # Sets the child widget of @combo_box.
    def child=(child : Gtk::Widget?) : Nil
      # gtk_combo_box_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_combo_box_set_child(@pointer, child)

      # Return value handling
    end

    # Sets the model column which @combo_box should use to get strings
    # from to be @text_column.
    #
    # For this column no separate
    # `Gtk#CellRenderer` is needed.
    #
    # The column @text_column in the model of @combo_box must be of
    # type %G_TYPE_STRING.
    #
    # This is only relevant if @combo_box has been created with
    # [property@Gtk.ComboBox:has-entry] as %TRUE.
    def entry_text_column=(text_column : Int32) : Nil
      # gtk_combo_box_set_entry_text_column: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_set_entry_text_column(@pointer, text_column)

      # Return value handling
    end

    # Sets the model column which @combo_box should use to get string IDs
    # for values from.
    #
    # The column @id_column in the model of @combo_box must be of type
    # %G_TYPE_STRING.
    def id_column=(id_column : Int32) : Nil
      # gtk_combo_box_set_id_column: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_set_id_column(@pointer, id_column)

      # Return value handling
    end

    # Sets the model used by @combo_box to be @model.
    #
    # Will unset a previously set model (if applicable). If model is %NULL,
    # then it will unset the model.
    #
    # Note that this function does not clear the cell renderers, you have to
    # call `Gtk::CellLayout#clear` yourself if you need to set up different
    # cell renderers for the new model.
    def model=(model : Gtk::TreeModel?) : Nil
      # gtk_combo_box_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_combo_box_set_model(@pointer, model)

      # Return value handling
    end

    # Specifies whether the popup’s width should be a fixed width.
    #
    # If @fixed is %TRUE, the popup's width is set to match the
    # allocated width of the combo box.
    def popup_fixed_width=(fixed : Bool) : Nil
      # gtk_combo_box_set_popup_fixed_width: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_combo_box_set_popup_fixed_width(@pointer, fixed)

      # Return value handling
    end

    # Sets the row separator function, which is used to determine
    # whether a row should be drawn as a separator.
    #
    # If the row separator function is %NULL, no separators are drawn.
    # This is the default value.
    def row_separator_func=(func : Gtk::TreeViewRowSeparatorFunc?) : Nil
      # gtk_combo_box_set_row_separator_func: (Method)
      # @func: (nullable)
      # @data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if func
        _box = ::Box.box(func)
        func = ->(lib_model : Pointer(Void), lib_iter : Pointer(Void), lib_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          model = Gtk::TreeModel.new(lib_model, :none)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Bool)).unbox(lib_data).call(model, iter)
        }.pointer
        data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        func = data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_combo_box_set_row_separator_func(@pointer, func, data, destroy)

      # Return value handling
    end

    # Emitted to when the combo box is activated.
    #
    # The `::activate` signal on `GtkComboBox` is an action signal and
    # emitting it causes the combo box to pop up its dropdown.
    struct ActivateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate::#{@detail}" : "activate"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::ComboBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ComboBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ComboBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ComboBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate")
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end

    # Emitted when the active item is changed.
    #
    # The can be due to the user selecting a different item from the list,
    # or due to a call to `Gtk::ComboBox#active_iter=`. It will
    # also be emitted while typing into the entry of a combo box with an entry.
    struct ChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::ComboBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ComboBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ComboBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ComboBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end

    # Emitted to allow changing how the text in a combo box's entry is displayed.
    #
    # See [property@Gtk.ComboBox:has-entry].
    #
    # Connect a signal handler which returns an allocated string representing
    # @path. That string will then be used to set the text in the combo box's
    # entry. The default signal handler uses the text from the
    # [property@Gtk.ComboBox:entry-text-column] model column.
    #
    # Here's an example signal handler which fetches data from the model and
    # displays it in the entry.
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # static char *
    # format_entry_text_callback (GtkComboBox *combo,
    #                             const char *path,
    #                             gpointer     user_data)
    # {
    #   GtkTreeIter iter;
    #   GtkTreeModel model;
    #   double       value;
    #
    #   model = gtk_combo_box_get_model (combo);
    #
    #   gtk_tree_model_get_iter_from_string (model, &iter, path);
    #   gtk_tree_model_get (model, &iter,
    #                       THE_DOUBLE_VALUE_COLUMN, &value,
    #                       -1);
    #
    #   return g_strdup_printf ("%g", value);
    # }
    # ```
    struct FormatEntryTextSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "format-entry-text::#{@detail}" : "format-entry-text"
      end

      def connect(&block : Proc(::String, ::String))
        connect(block)
      end

      def connect_after(&block : Proc(::String, ::String))
        connect(block)
      end

      def connect(handler : Proc(::String, ::String))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(::String, ::String)).unbox(_lib_box).call(path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(::String, ::String))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(::String, ::String)).unbox(_lib_box).call(path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::ComboBox, ::String, ::String))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::ComboBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(Gtk::ComboBox, ::String, ::String)).unbox(_lib_box).call(_sender, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ComboBox, ::String, ::String))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::ComboBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(Gtk::ComboBox, ::String, ::String)).unbox(_lib_box).call(_sender, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(path : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "format-entry-text", path)
      end
    end

    def format_entry_text_signal
      FormatEntryTextSignal.new(self)
    end

    # Emitted to move the active selection.
    #
    # This is an [keybinding signal](class.SignalAction.html).
    struct MoveActiveSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "move-active::#{@detail}" : "move-active"
      end

      def connect(&block : Proc(Gtk::ScrollType, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ScrollType, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::ScrollType, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll_type : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          scroll_type = Gtk::ScrollType.new(lib_scroll_type)
          ::Box(Proc(Gtk::ScrollType, Nil)).unbox(_lib_box).call(scroll_type)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ScrollType, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll_type : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          scroll_type = Gtk::ScrollType.new(lib_scroll_type)
          ::Box(Proc(Gtk::ScrollType, Nil)).unbox(_lib_box).call(scroll_type)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::ComboBox, Gtk::ScrollType, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll_type : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::ComboBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          scroll_type = Gtk::ScrollType.new(lib_scroll_type)
          ::Box(Proc(Gtk::ComboBox, Gtk::ScrollType, Nil)).unbox(_lib_box).call(_sender, scroll_type)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ComboBox, Gtk::ScrollType, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll_type : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::ComboBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          scroll_type = Gtk::ScrollType.new(lib_scroll_type)
          ::Box(Proc(Gtk::ComboBox, Gtk::ScrollType, Nil)).unbox(_lib_box).call(_sender, scroll_type)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(scroll_type : Gtk::ScrollType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-active", scroll_type)
      end
    end

    def move_active_signal
      MoveActiveSignal.new(self)
    end

    # Emitted to popdown the combo box list.
    #
    # This is an [keybinding signal](class.SignalAction.html).
    #
    # The default bindings for this signal are Alt+Up and Escape.
    struct PopdownSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "popdown::#{@detail}" : "popdown"
      end

      def connect(&block : Proc(Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool))
        connect(block)
      end

      def connect(handler : Proc(Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::ComboBox, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ComboBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ComboBox, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ComboBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "popdown")
      end
    end

    def popdown_signal
      PopdownSignal.new(self)
    end

    # Emitted to popup the combo box list.
    #
    # This is an [keybinding signal](class.SignalAction.html).
    #
    # The default binding for this signal is Alt+Down.
    struct PopupSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "popup::#{@detail}" : "popup"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::ComboBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ComboBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ComboBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ComboBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "popup")
      end
    end

    def popup_signal
      PopupSignal.new(self)
    end
  end
end
