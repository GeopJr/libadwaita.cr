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
  # [iface@Gtk.CellLayout] interface. The tree model holding the valid
  # choices is not restricted to a flat list, it can be a real tree, and the
  # popup will reflect the tree structure.
  #
  # To allow the user to enter values not in the model, the
  # [property@Gtk.ComboBox:has-entry] property allows the `GtkComboBox` to
  # contain a [class@Gtk.Entry]. This entry can be accessed by calling
  # [method@Gtk.ComboBox.get_child] on the combo box.
  #
  # For a simple list of textual choices, the model-view API of `GtkComboBox`
  # can be a bit overwhelming. In this case, [class@Gtk.ComboBoxText] offers
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
  class ComboBox < Widget
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

      @pointer = LibGObject.g_object_new_with_properties(ComboBox.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_combo_box_get_type
    end

    def has_entry=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-entry", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize
      # gtk_combo_box_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_new
      @pointer = _retval
    end

    def self.new_with_entry : Gtk::Widget
      # gtk_combo_box_new_with_entry: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_new_with_entry
      Gtk::ComboBox.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_with_model(model : Gtk::TreeModel) : Gtk::Widget
      # gtk_combo_box_new_with_model: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_new_with_model(model)
      Gtk::ComboBox.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_with_model_and_entry(model : Gtk::TreeModel) : Gtk::Widget
      # gtk_combo_box_new_with_model_and_entry: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_new_with_model_and_entry(model)
      Gtk::ComboBox.new(_retval, GICrystal::Transfer::Full)
    end

    def active : Int32
      # gtk_combo_box_get_active: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_get_active(self)
      _retval
    end

    def active_id : ::String?
      # gtk_combo_box_get_active_id: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_get_active_id(self)
      ::String.new(_retval) unless _retval.null?
    end

    def active_iter : Gtk::TreeIter
      # gtk_combo_box_get_active_iter: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      iter = Gtk::TreeIter.new

      _retval = LibGtk.gtk_combo_box_get_active_iter(self, iter)
      iter
    end

    def button_sensitivity : Gtk::SensitivityType
      # gtk_combo_box_get_button_sensitivity: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_get_button_sensitivity(self)
      Gtk::SensitivityType.from_value(_retval)
    end

    def child : Gtk::Widget?
      # gtk_combo_box_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_get_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def entry_text_column : Int32
      # gtk_combo_box_get_entry_text_column: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_get_entry_text_column(self)
      _retval
    end

    def has_entry? : Bool
      # gtk_combo_box_get_has_entry: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_get_has_entry(self)
      GICrystal.to_bool(_retval)
    end

    def id_column : Int32
      # gtk_combo_box_get_id_column: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_get_id_column(self)
      _retval
    end

    def model : Gtk::TreeModel?
      # gtk_combo_box_get_model: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_get_model(self)
      Gtk::TreeModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def popup_fixed_width? : Bool
      # gtk_combo_box_get_popup_fixed_width: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_combo_box_get_popup_fixed_width(self)
      GICrystal.to_bool(_retval)
    end

    def popdown : Nil
      # gtk_combo_box_popdown: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_popdown(self)
    end

    def popup : Nil
      # gtk_combo_box_popup: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_popup(self)
    end

    def popup_for_device(device : Gdk::Device) : Nil
      # gtk_combo_box_popup_for_device: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_popup_for_device(self, device)
    end

    def active=(index_ : Int32) : Nil
      # gtk_combo_box_set_active: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_set_active(self, index_)
    end

    def active_id=(active_id : ::String?) : Bool
      # gtk_combo_box_set_active_id: (Method)
      # @active_id: (nullable)
      # Returns: (transfer none)

      active_id = if active_id.nil?
                    Pointer(LibC::Char).null
                  else
                    active_id.to_unsafe
                  end

      _retval = LibGtk.gtk_combo_box_set_active_id(self, active_id)
      GICrystal.to_bool(_retval)
    end

    def active_iter=(iter : Gtk::TreeIter?) : Nil
      # gtk_combo_box_set_active_iter: (Method)
      # @iter: (nullable)
      # Returns: (transfer none)

      iter = if iter.nil?
               Pointer(Void).null
             else
               iter.to_unsafe
             end

      LibGtk.gtk_combo_box_set_active_iter(self, iter)
    end

    def button_sensitivity=(sensitivity : Gtk::SensitivityType) : Nil
      # gtk_combo_box_set_button_sensitivity: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_set_button_sensitivity(self, sensitivity)
    end

    def child=(child : Gtk::Widget?) : Nil
      # gtk_combo_box_set_child: (Method)
      # @child: (nullable)
      # Returns: (transfer none)

      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      LibGtk.gtk_combo_box_set_child(self, child)
    end

    def entry_text_column=(text_column : Int32) : Nil
      # gtk_combo_box_set_entry_text_column: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_set_entry_text_column(self, text_column)
    end

    def id_column=(id_column : Int32) : Nil
      # gtk_combo_box_set_id_column: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_set_id_column(self, id_column)
    end

    def model=(model : Gtk::TreeModel?) : Nil
      # gtk_combo_box_set_model: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_combo_box_set_model(self, model)
    end

    def popup_fixed_width=(fixed : Bool) : Nil
      # gtk_combo_box_set_popup_fixed_width: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_combo_box_set_popup_fixed_width(self, fixed)
    end

    def set_row_separator_func(func : Pointer(Void)?, data : Pointer(Nil)?, destroy : Pointer(Void)?) : Nil
      # gtk_combo_box_set_row_separator_func: (Method)
      # @func: (nullable)
      # @data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      func = if func.nil?
               LibGtk::TreeViewRowSeparatorFunc.null
             else
               func.to_unsafe
             end
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end
      destroy = if destroy.nil?
                  LibGLib::DestroyNotify.null
                else
                  destroy.to_unsafe
                end

      LibGtk.gtk_combo_box_set_row_separator_func(self, func, data, destroy)
    end

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

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ComboBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ComboBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ComboBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ComboBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end

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

      def connect(block : Proc(::String, ::String))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, ::String)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, ::String))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, ::String)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ComboBox, ::String, ::String))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::ComboBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::ComboBox, ::String, ::String)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ComboBox, ::String, ::String))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::ComboBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::ComboBox, ::String, ::String)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(path : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "format-entry-text", path)
      end
    end

    def format_entry_text_signal
      FormatEntryTextSignal.new(self)
    end

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

      def connect(block : Proc(Gtk::ScrollType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ScrollType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ScrollType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ScrollType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ComboBox, Gtk::ScrollType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::ComboBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ComboBox, Gtk::ScrollType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ComboBox, Gtk::ScrollType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::ComboBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ComboBox, Gtk::ScrollType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(scroll_type : Gtk::ScrollType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-active", scroll_type)
      end
    end

    def move_active_signal
      MoveActiveSignal.new(self)
    end

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

      def connect(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ComboBox, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ComboBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ComboBox, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ComboBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "popdown")
      end
    end

    def popdown_signal
      PopdownSignal.new(self)
    end

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

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ComboBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ComboBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ComboBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ComboBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ComboBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
