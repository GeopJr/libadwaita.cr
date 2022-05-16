require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./scrollable"

module Gtk
  # A widget for displaying both trees and lists
  #
  # Widget that displays any object that implements the `Gtk#TreeModel` interface.
  #
  # Please refer to the [tree widget conceptual overview](section-tree-widget.html)
  # for an overview of all the objects and data types related to the tree
  # widget and how they work together.
  #
  # ## Coordinate systems in GtkTreeView API
  #
  # Several different coordinate systems are exposed in the `GtkTreeView` API.
  # These are:
  #
  # ![](tree-view-coordinates.png)
  #
  # - Widget coordinates: Coordinates relative to the widget (usually `widget->window`).
  #
  # - Bin window coordinates: Coordinates relative to the window that GtkTreeView renders to.
  #
  # - Tree coordinates: Coordinates relative to the entire scrollable area of GtkTreeView. These
  #   coordinates start at (0, 0) for row 0 of the tree.
  #
  # Several functions are available for converting between the different
  # coordinate systems.  The most common translations are between widget and bin
  # window coordinates and between bin window and tree coordinates. For the
  # former you can use `Gtk::TreeView#convert_widget_to_bin_window_coords`
  # (and vice versa), for the latter `Gtk::TreeView#convert_bin_window_to_tree_coords`
  # (and vice versa).
  #
  # ## `GtkTreeView` as `GtkBuildable`
  #
  # The `GtkTreeView` implementation of the `GtkBuildable` interface accepts
  # `Gtk#TreeViewColumn` objects as `<child>` elements and exposes the
  # internal `Gtk#TreeSelection` in UI definitions.
  #
  # An example of a UI definition fragment with `GtkTreeView`:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkTreeView" id="treeview">
  #   <property name="model">liststore1</property>
  #   <child>
  #     <object class="GtkTreeViewColumn" id="test-column">
  #       <property name="title">Test</property>
  #       <child>
  #         <object class="GtkCellRendererText" id="test-renderer"/>
  #         <attributes>
  #           <attribute name="text">1</attribute>
  #         </attributes>
  #       </child>
  #     </object>
  #   </child>
  #   <child internal-child="selection">
  #     <object class="GtkTreeSelection" id="selection">
  #       <signal name="changed" handler="on_treeview_selection_changed"/>
  #     </object>
  #   </child>
  # </object>
  # ```
  #
  # ## CSS nodes
  #
  # ```
  # treeview.view
  # ├── header
  # │ ├── button
  # │ │ ╰── [sort - indicator]
  # ┊ ┊
  # │ ╰── button
  # │ ╰── [sort - indicator]
  # │
  # ├── [rubberband]
  # ╰── [dndtarget]
  # ```
  #
  # `GtkTreeView` has a main CSS node with name `treeview` and style class `.view`.
  # It has a subnode with name `header`, which is the parent for all the column
  # header widgets' CSS nodes.
  #
  # Each column header consists of a `button`, which among other content, has a
  # child with name `sort-indicator`, which carries the `.ascending` or `.descending`
  # style classes when the column header should show a sort indicator. The CSS
  # is expected to provide a suitable image using the `-gtk-icon-source` property.
  #
  # For rubberband selection, a subnode with name `rubberband` is used.
  #
  # For the drop target location during DND, a subnode with name `dndtarget` is used.
  @[GObject::GeneratedWrapper]
  class TreeView < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Scrollable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::TreeViewClass), class_init,
        sizeof(LibGtk::TreeView), instance_init, 0)
    end

    GICrystal.define_new_method(TreeView, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TreeView`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, activate_on_single_click : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, enable_grid_lines : Gtk::TreeViewGridLines? = nil, enable_search : Bool? = nil, enable_tree_lines : Bool? = nil, expander_column : Gtk::TreeViewColumn? = nil, fixed_height_mode : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, headers_clickable : Bool? = nil, headers_visible : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hover_expand : Bool? = nil, hover_selection : Bool? = nil, hscroll_policy : Gtk::ScrollablePolicy? = nil, layout_manager : Gtk::LayoutManager? = nil, level_indentation : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, model : Gtk::TreeModel? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, reorderable : Bool? = nil, root : Gtk::Root? = nil, rubber_banding : Bool? = nil, scale_factor : Int32? = nil, search_column : Int32? = nil, sensitive : Bool? = nil, show_expanders : Bool? = nil, tooltip_column : Int32? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, vscroll_policy : Gtk::ScrollablePolicy? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[56]
      _values = StaticArray(LibGObject::Value, 56).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !activate_on_single_click.nil?
        (_names.to_unsafe + _n).value = "activate-on-single-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activate_on_single_click)
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
      if !enable_grid_lines.nil?
        (_names.to_unsafe + _n).value = "enable-grid-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_grid_lines)
        _n += 1
      end
      if !enable_search.nil?
        (_names.to_unsafe + _n).value = "enable-search".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_search)
        _n += 1
      end
      if !enable_tree_lines.nil?
        (_names.to_unsafe + _n).value = "enable-tree-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_tree_lines)
        _n += 1
      end
      if !expander_column.nil?
        (_names.to_unsafe + _n).value = "expander-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expander_column)
        _n += 1
      end
      if !fixed_height_mode.nil?
        (_names.to_unsafe + _n).value = "fixed-height-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fixed_height_mode)
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
      if !hadjustment.nil?
        (_names.to_unsafe + _n).value = "hadjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hadjustment)
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
      if !has_focus.nil?
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if !has_tooltip.nil?
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if !headers_clickable.nil?
        (_names.to_unsafe + _n).value = "headers-clickable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, headers_clickable)
        _n += 1
      end
      if !headers_visible.nil?
        (_names.to_unsafe + _n).value = "headers-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, headers_visible)
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
      if !hover_expand.nil?
        (_names.to_unsafe + _n).value = "hover-expand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hover_expand)
        _n += 1
      end
      if !hover_selection.nil?
        (_names.to_unsafe + _n).value = "hover-selection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hover_selection)
        _n += 1
      end
      if !hscroll_policy.nil?
        (_names.to_unsafe + _n).value = "hscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hscroll_policy)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !level_indentation.nil?
        (_names.to_unsafe + _n).value = "level-indentation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, level_indentation)
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
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !reorderable.nil?
        (_names.to_unsafe + _n).value = "reorderable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reorderable)
        _n += 1
      end
      if !root.nil?
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if !rubber_banding.nil?
        (_names.to_unsafe + _n).value = "rubber-banding".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rubber_banding)
        _n += 1
      end
      if !scale_factor.nil?
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if !search_column.nil?
        (_names.to_unsafe + _n).value = "search-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, search_column)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !show_expanders.nil?
        (_names.to_unsafe + _n).value = "show-expanders".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_expanders)
        _n += 1
      end
      if !tooltip_column.nil?
        (_names.to_unsafe + _n).value = "tooltip-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_column)
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
      if !vadjustment.nil?
        (_names.to_unsafe + _n).value = "vadjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vadjustment)
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
      if !vscroll_policy.nil?
        (_names.to_unsafe + _n).value = "vscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vscroll_policy)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeView.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_view_get_type
    end

    def activate_on_single_click=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "activate-on-single-click", unsafe_value, Pointer(Void).null)
      value
    end

    def activate_on_single_click? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "activate-on-single-click", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def enable_grid_lines=(value : Gtk::TreeViewGridLines) : Gtk::TreeViewGridLines
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-grid-lines", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_grid_lines : Gtk::TreeViewGridLines
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "enable-grid-lines", pointerof(value), Pointer(Void).null)
      Gtk::TreeViewGridLines.new(value)
    end

    def enable_search=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-search", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_search? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enable-search", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def enable_tree_lines=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-tree-lines", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_tree_lines? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enable-tree-lines", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def expander_column=(value : Gtk::TreeViewColumn?) : Gtk::TreeViewColumn?
      unsafe_value = value

      LibGObject.g_object_set(self, "expander-column", unsafe_value, Pointer(Void).null)
      value
    end

    def expander_column : Gtk::TreeViewColumn?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "expander-column", pointerof(value), Pointer(Void).null)
      Gtk::TreeViewColumn.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def fixed_height_mode=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "fixed-height-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def fixed_height_mode? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "fixed-height-mode", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def headers_clickable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "headers-clickable", unsafe_value, Pointer(Void).null)
      value
    end

    def headers_clickable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "headers-clickable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def headers_visible=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "headers-visible", unsafe_value, Pointer(Void).null)
      value
    end

    def headers_visible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "headers-visible", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def hover_expand=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "hover-expand", unsafe_value, Pointer(Void).null)
      value
    end

    def hover_expand? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "hover-expand", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def hover_selection=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "hover-selection", unsafe_value, Pointer(Void).null)
      value
    end

    def hover_selection? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "hover-selection", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def level_indentation=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "level-indentation", unsafe_value, Pointer(Void).null)
      value
    end

    def level_indentation : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "level-indentation", pointerof(value), Pointer(Void).null)
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

    def reorderable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "reorderable", unsafe_value, Pointer(Void).null)
      value
    end

    def reorderable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "reorderable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def rubber_banding=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "rubber-banding", unsafe_value, Pointer(Void).null)
      value
    end

    def rubber_banding? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "rubber-banding", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def search_column=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "search-column", unsafe_value, Pointer(Void).null)
      value
    end

    def search_column : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "search-column", pointerof(value), Pointer(Void).null)
      value
    end

    def show_expanders=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-expanders", unsafe_value, Pointer(Void).null)
      value
    end

    def show_expanders? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-expanders", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def tooltip_column=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "tooltip-column", unsafe_value, Pointer(Void).null)
      value
    end

    def tooltip_column : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "tooltip-column", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new `GtkTreeView` widget.
    def initialize
      # gtk_tree_view_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new `GtkTreeView` widget with the model initialized to @model.
    def self.new_with_model(model : Gtk::TreeModel) : self
      # gtk_tree_view_new_with_model: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_new_with_model(model)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::TreeView.new(_retval, GICrystal::Transfer::Full)
    end

    # Appends @column to the list of columns. If @tree_view has “fixed_height”
    # mode enabled, then @column must have its “sizing” property set to be
    # GTK_TREE_VIEW_COLUMN_FIXED.
    def append_column(column : Gtk::TreeViewColumn) : Int32
      # gtk_tree_view_append_column: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_append_column(@pointer, column)

      # Return value handling

      _retval
    end

    # Recursively collapses all visible, expanded nodes in @tree_view.
    def collapse_all : Nil
      # gtk_tree_view_collapse_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_collapse_all(@pointer)

      # Return value handling
    end

    # Collapses a row (hides its child rows, if they exist).
    def collapse_row(path : Gtk::TreePath) : Bool
      # gtk_tree_view_collapse_row: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_collapse_row(@pointer, path)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Resizes all columns to their optimal width. Only works after the
    # treeview has been realized.
    def columns_autosize : Nil
      # gtk_tree_view_columns_autosize: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_columns_autosize(@pointer)

      # Return value handling
    end

    # Converts bin_window coordinates to coordinates for the
    # tree (the full scrollable area of the tree).
    def convert_bin_window_to_tree_coords(bx : Int32, by : Int32, tx : Int32, ty : Int32) : Nil
      # gtk_tree_view_convert_bin_window_to_tree_coords: (Method)
      # @tx: (out) (transfer full)
      # @ty: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_convert_bin_window_to_tree_coords(@pointer, bx, by, tx, ty)

      # Return value handling
    end

    # Converts bin_window coordinates to widget relative coordinates.
    def convert_bin_window_to_widget_coords(bx : Int32, by : Int32, wx : Int32, wy : Int32) : Nil
      # gtk_tree_view_convert_bin_window_to_widget_coords: (Method)
      # @wx: (out) (transfer full)
      # @wy: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_convert_bin_window_to_widget_coords(@pointer, bx, by, wx, wy)

      # Return value handling
    end

    # Converts tree coordinates (coordinates in full scrollable area of the tree)
    # to bin_window coordinates.
    def convert_tree_to_bin_window_coords(tx : Int32, ty : Int32, bx : Int32, by : Int32) : Nil
      # gtk_tree_view_convert_tree_to_bin_window_coords: (Method)
      # @bx: (out) (transfer full)
      # @by: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_convert_tree_to_bin_window_coords(@pointer, tx, ty, bx, by)

      # Return value handling
    end

    # Converts tree coordinates (coordinates in full scrollable area of the tree)
    # to widget coordinates.
    def convert_tree_to_widget_coords(tx : Int32, ty : Int32, wx : Int32, wy : Int32) : Nil
      # gtk_tree_view_convert_tree_to_widget_coords: (Method)
      # @wx: (out) (transfer full)
      # @wy: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_convert_tree_to_widget_coords(@pointer, tx, ty, wx, wy)

      # Return value handling
    end

    # Converts widget coordinates to coordinates for the bin_window.
    def convert_widget_to_bin_window_coords(wx : Int32, wy : Int32, bx : Int32, by : Int32) : Nil
      # gtk_tree_view_convert_widget_to_bin_window_coords: (Method)
      # @bx: (out) (transfer full)
      # @by: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_convert_widget_to_bin_window_coords(@pointer, wx, wy, bx, by)

      # Return value handling
    end

    # Converts widget coordinates to coordinates for the
    # tree (the full scrollable area of the tree).
    def convert_widget_to_tree_coords(wx : Int32, wy : Int32, tx : Int32, ty : Int32) : Nil
      # gtk_tree_view_convert_widget_to_tree_coords: (Method)
      # @tx: (out) (transfer full)
      # @ty: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_convert_widget_to_tree_coords(@pointer, wx, wy, tx, ty)

      # Return value handling
    end

    # Creates a `cairo_surface_t` representation of the row at @path.
    # This image is used for a drag icon.
    def create_row_drag_icon(path : Gtk::TreePath) : Gdk::Paintable?
      # gtk_tree_view_create_row_drag_icon: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_view_create_row_drag_icon(@pointer, path)

      # Return value handling

      Gdk::AbstractPaintable.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Turns @tree_view into a drop destination for automatic DND. Calling
    # this method sets `GtkTreeView`:reorderable to %FALSE.
    def enable_model_drag_dest(formats : Gdk::ContentFormats, actions : Gdk::DragAction) : Nil
      # gtk_tree_view_enable_model_drag_dest: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_enable_model_drag_dest(@pointer, formats, actions)

      # Return value handling
    end

    # Turns @tree_view into a drag source for automatic DND. Calling this
    # method sets `GtkTreeView`:reorderable to %FALSE.
    def enable_model_drag_source(start_button_mask : Gdk::ModifierType, formats : Gdk::ContentFormats, actions : Gdk::DragAction) : Nil
      # gtk_tree_view_enable_model_drag_source: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_enable_model_drag_source(@pointer, start_button_mask, formats, actions)

      # Return value handling
    end

    # Recursively expands all nodes in the @tree_view.
    def expand_all : Nil
      # gtk_tree_view_expand_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_expand_all(@pointer)

      # Return value handling
    end

    # Opens the row so its children are visible.
    def expand_row(path : Gtk::TreePath, open_all : Bool) : Bool
      # gtk_tree_view_expand_row: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_expand_row(@pointer, path, open_all)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Expands the row at @path. This will also expand all parent rows of
    # @path as necessary.
    def expand_to_path(path : Gtk::TreePath) : Nil
      # gtk_tree_view_expand_to_path: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_expand_to_path(@pointer, path)

      # Return value handling
    end

    # Gets the setting set by gtk_tree_view_set_activate_on_single_click().
    def activate_on_single_click : Bool
      # gtk_tree_view_get_activate_on_single_click: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_activate_on_single_click(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Fills the bounding rectangle in bin_window coordinates for the cell at the
    # row specified by @path and the column specified by @column.  If @path is
    # %NULL, or points to a node not found in the tree, the @y and @height fields of
    # the rectangle will be filled with 0. If @column is %NULL, the @x and @width
    # fields will be filled with 0.  The returned rectangle is equivalent to the
    # @background_area passed to gtk_cell_renderer_render().  These background
    # areas tile to cover the entire bin window.  Contrast with the @cell_area,
    # returned by gtk_tree_view_get_cell_area(), which returns only the cell
    # itself, excluding surrounding borders and the tree expander area.
    def background_area(path : Gtk::TreePath?, column : Gtk::TreeViewColumn?) : Gdk::Rectangle
      # gtk_tree_view_get_background_area: (Method)
      # @path: (nullable)
      # @column: (nullable)
      # @rect: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end
      # Generator::NullableArrayPlan
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end
      # Generator::CallerAllocatesPlan
      rect = Gdk::Rectangle.new
      # C call
      LibGtk.gtk_tree_view_get_background_area(@pointer, path, column, rect)

      # Return value handling

      rect
    end

    # Fills the bounding rectangle in bin_window coordinates for the cell at the
    # row specified by @path and the column specified by @column.  If @path is
    # %NULL, or points to a path not currently displayed, the @y and @height fields
    # of the rectangle will be filled with 0. If @column is %NULL, the @x and @width
    # fields will be filled with 0.  The sum of all cell rects does not cover the
    # entire tree; there are extra pixels in between rows, for example. The
    # returned rectangle is equivalent to the @cell_area passed to
    # gtk_cell_renderer_render().  This function is only valid if @tree_view is
    # realized.
    def cell_area(path : Gtk::TreePath?, column : Gtk::TreeViewColumn?) : Gdk::Rectangle
      # gtk_tree_view_get_cell_area: (Method)
      # @path: (nullable)
      # @column: (nullable)
      # @rect: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end
      # Generator::NullableArrayPlan
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end
      # Generator::CallerAllocatesPlan
      rect = Gdk::Rectangle.new
      # C call
      LibGtk.gtk_tree_view_get_cell_area(@pointer, path, column, rect)

      # Return value handling

      rect
    end

    # Gets the `GtkTreeViewColumn` at the given position in the #tree_view.
    def column(n : Int32) : Gtk::TreeViewColumn?
      # gtk_tree_view_get_column: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_column(@pointer, n)

      # Return value handling

      Gtk::TreeViewColumn.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns a `GList` of all the `GtkTreeViewColumn`s currently in @tree_view.
    # The returned list must be freed with g_list_free ().
    def columns : GLib::List
      # gtk_tree_view_get_columns: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGtk.gtk_tree_view_get_columns(@pointer)

      # Return value handling

      GLib::List(Gtk::TreeViewColumn).new(_retval, GICrystal::Transfer::Container)
    end

    # Fills in @path and @focus_column with the current path and focus column.  If
    # the cursor isn’t currently set, then *@path will be %NULL.  If no column
    # currently has focus, then *@focus_column will be %NULL.
    #
    # The returned `GtkTreePath` must be freed with gtk_tree_path_free() when
    # you are done with it.
    def cursor : Nil
      # gtk_tree_view_get_cursor: (Method)
      # @path: (out) (transfer full) (nullable) (optional)
      # @focus_column: (out) (nullable) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      path = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      focus_column = Pointer(Pointer(Void)).null
      # C call
      LibGtk.gtk_tree_view_get_cursor(@pointer, path, focus_column)

      # Return value handling
    end

    # Determines the destination row for a given position.  @drag_x and
    # @drag_y are expected to be in widget coordinates.  This function is only
    # meaningful if @tree_view is realized.  Therefore this function will always
    # return %FALSE if @tree_view is not realized or does not have a model.
    def dest_row_at_pos(drag_x : Int32, drag_y : Int32) : Bool
      # gtk_tree_view_get_dest_row_at_pos: (Method)
      # @path: (out) (transfer full) (nullable) (optional)
      # @pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      path = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      pos = Pointer(UInt32).null
      # C call
      _retval = LibGtk.gtk_tree_view_get_dest_row_at_pos(@pointer, drag_x, drag_y, path, pos)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets information about the row that is highlighted for feedback.
    def drag_dest_row : Nil
      # gtk_tree_view_get_drag_dest_row: (Method)
      # @path: (out) (transfer full) (nullable) (optional)
      # @pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      path = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      pos = Pointer(UInt32).null
      # C call
      LibGtk.gtk_tree_view_get_drag_dest_row(@pointer, path, pos)

      # Return value handling
    end

    # Returns whether or not the tree allows to start interactive searching
    # by typing in text.
    def enable_search : Bool
      # gtk_tree_view_get_enable_search: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_enable_search(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether or not tree lines are drawn in @tree_view.
    def enable_tree_lines : Bool
      # gtk_tree_view_get_enable_tree_lines: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_enable_tree_lines(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the column that is the current expander column,
    # or %NULL if none has been set.
    # This column has the expander arrow drawn next to it.
    def expander_column : Gtk::TreeViewColumn?
      # gtk_tree_view_get_expander_column: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_expander_column(@pointer)

      # Return value handling

      Gtk::TreeViewColumn.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether fixed height mode is turned on for @tree_view.
    def fixed_height_mode : Bool
      # gtk_tree_view_get_fixed_height_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_fixed_height_mode(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns which grid lines are enabled in @tree_view.
    def grid_lines : Gtk::TreeViewGridLines
      # gtk_tree_view_get_grid_lines: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_grid_lines(@pointer)

      # Return value handling

      Gtk::TreeViewGridLines.new(_retval)
    end

    # Returns whether all header columns are clickable.
    def headers_clickable : Bool
      # gtk_tree_view_get_headers_clickable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_headers_clickable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns %TRUE if the headers on the @tree_view are visible.
    def headers_visible : Bool
      # gtk_tree_view_get_headers_visible: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_headers_visible(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether hover expansion mode is turned on for @tree_view.
    def hover_expand : Bool
      # gtk_tree_view_get_hover_expand: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_hover_expand(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether hover selection mode is turned on for @tree_view.
    def hover_selection : Bool
      # gtk_tree_view_get_hover_selection: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_hover_selection(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the amount, in pixels, of extra indentation for child levels
    # in @tree_view.
    def level_indentation : Int32
      # gtk_tree_view_get_level_indentation: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_level_indentation(@pointer)

      # Return value handling

      _retval
    end

    # Returns the model the `GtkTreeView` is based on.  Returns %NULL if the
    # model is unset.
    def model : Gtk::TreeModel?
      # gtk_tree_view_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_model(@pointer)

      # Return value handling

      Gtk::AbstractTreeModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Queries the number of columns in the given @tree_view.
    def n_columns : UInt32
      # gtk_tree_view_get_n_columns: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_n_columns(@pointer)

      # Return value handling

      _retval
    end

    # Finds the path at the point (@x, @y), relative to bin_window coordinates.
    # That is, @x and @y are relative to an events coordinates. Widget-relative
    # coordinates must be converted using
    # gtk_tree_view_convert_widget_to_bin_window_coords(). It is primarily for
    # things like popup menus. If @path is non-%NULL, then it will be filled
    # with the `GtkTreePath` at that point.  This path should be freed with
    # gtk_tree_path_free().  If @column is non-%NULL, then it will be filled
    # with the column at that point.  @cell_x and @cell_y return the coordinates
    # relative to the cell background (i.e. the @background_area passed to
    # gtk_cell_renderer_render()).  This function is only meaningful if
    # @tree_view is realized.  Therefore this function will always return %FALSE
    # if @tree_view is not realized or does not have a model.
    #
    # For converting widget coordinates (eg. the ones you get from
    # GtkWidget::query-tooltip), please see
    # gtk_tree_view_convert_widget_to_bin_window_coords().
    def path_at_pos(x : Int32, y : Int32) : Bool
      # gtk_tree_view_get_path_at_pos: (Method)
      # @path: (out) (transfer full) (nullable) (optional)
      # @column: (out) (nullable) (optional)
      # @cell_x: (out) (transfer full) (optional)
      # @cell_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      path = Pointer(Pointer(Void)).null   # Generator::OutArgUsedInReturnPlan
      column = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      cell_x = Pointer(Int32).null         # Generator::OutArgUsedInReturnPlan
      cell_y = Pointer(Int32).null
      # C call
      _retval = LibGtk.gtk_tree_view_get_path_at_pos(@pointer, x, y, path, column, cell_x, cell_y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves whether the user can reorder the tree via drag-and-drop. See
    # gtk_tree_view_set_reorderable().
    def reorderable : Bool
      # gtk_tree_view_get_reorderable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_reorderable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether rubber banding is turned on for @tree_view.  If the
    # selection mode is %GTK_SELECTION_MULTIPLE, rubber banding will allow the
    # user to select multiple rows by dragging the mouse.
    def rubber_banding : Bool
      # gtk_tree_view_get_rubber_banding: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_rubber_banding(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the column searched on by the interactive search code.
    def search_column : Int32
      # gtk_tree_view_get_search_column: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_search_column(@pointer)

      # Return value handling

      _retval
    end

    # Returns the `GtkEntry` which is currently in use as interactive search
    # entry for @tree_view.  In case the built-in entry is being used, %NULL
    # will be returned.
    def search_entry : Gtk::Editable?
      # gtk_tree_view_get_search_entry: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_search_entry(@pointer)

      # Return value handling

      Gtk::AbstractEditable.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the `GtkTreeSelection` associated with @tree_view.
    def selection : Gtk::TreeSelection
      # gtk_tree_view_get_selection: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_selection(@pointer)

      # Return value handling

      Gtk::TreeSelection.new(_retval, GICrystal::Transfer::None)
    end

    # Returns whether or not expanders are drawn in @tree_view.
    def show_expanders : Bool
      # gtk_tree_view_get_show_expanders: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_show_expanders(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the column of @tree_view’s model which is being used for
    # displaying tooltips on @tree_view’s rows.
    def tooltip_column : Int32
      # gtk_tree_view_get_tooltip_column: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_get_tooltip_column(@pointer)

      # Return value handling

      _retval
    end

    # This function is supposed to be used in a ::query-tooltip
    # signal handler for `GtkTreeView`. The @x, @y and @keyboard_tip values
    # which are received in the signal handler, should be passed to this
    # function without modification.
    #
    # The return value indicates whether there is a tree view row at the given
    # coordinates (%TRUE) or not (%FALSE) for mouse tooltips. For keyboard
    # tooltips the row returned will be the cursor row. When %TRUE, then any of
    # @model, @path and @iter which have been provided will be set to point to
    # that row and the corresponding model. @x and @y will always be converted
    # to be relative to @tree_view’s bin_window if @keyboard_tooltip is %FALSE.
    def tooltip_context(x : Int32, y : Int32, keyboard_tip : Bool) : Gtk::TreeIter
      # gtk_tree_view_get_tooltip_context: (Method)
      # @model: (out) (nullable) (optional)
      # @path: (out) (transfer full) (optional)
      # @iter: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      model = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      path = Pointer(Pointer(Void)).null  # Generator::OutArgUsedInReturnPlan
      iter = Pointer(Void).null           # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new
      # C call
      _retval = LibGtk.gtk_tree_view_get_tooltip_context(@pointer, x, y, keyboard_tip, model, path, iter)

      # Return value handling

      iter
    end

    # Sets @start_path and @end_path to be the first and last visible path.
    # Note that there may be invisible paths in between.
    #
    # The paths should be freed with gtk_tree_path_free() after use.
    def visible_range : Bool
      # gtk_tree_view_get_visible_range: (Method)
      # @start_path: (out) (transfer full) (optional)
      # @end_path: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      start_path = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      end_path = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGtk.gtk_tree_view_get_visible_range(@pointer, start_path, end_path)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Fills @visible_rect with the currently-visible region of the
    # buffer, in tree coordinates. Convert to bin_window coordinates with
    # gtk_tree_view_convert_tree_to_bin_window_coords().
    # Tree coordinates start at 0,0 for row 0 of the tree, and cover the entire
    # scrollable area of the tree.
    def visible_rect : Gdk::Rectangle
      # gtk_tree_view_get_visible_rect: (Method)
      # @visible_rect: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      visible_rect = Gdk::Rectangle.new
      # C call
      LibGtk.gtk_tree_view_get_visible_rect(@pointer, visible_rect)

      # Return value handling

      visible_rect
    end

    # This inserts the @column into the @tree_view at @position.  If @position is
    # -1, then the column is inserted at the end. If @tree_view has
    # “fixed_height” mode enabled, then @column must have its “sizing” property
    # set to be GTK_TREE_VIEW_COLUMN_FIXED.
    def insert_column(column : Gtk::TreeViewColumn, position : Int32) : Int32
      # gtk_tree_view_insert_column: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_insert_column(@pointer, column, position)

      # Return value handling

      _retval
    end

    # Convenience function that inserts a new column into the `GtkTreeView`
    # with the given cell renderer and a `GtkTreeCellDataFunc` to set cell renderer
    # attributes (normally using data from the model). See also
    # gtk_tree_view_column_set_cell_data_func(), gtk_tree_view_column_pack_start().
    # If @tree_view has “fixed_height” mode enabled, then the new column will have its
    # “sizing” property set to be GTK_TREE_VIEW_COLUMN_FIXED.
    def insert_column_with_data_func(position : Int32, title : ::String, cell : Gtk::CellRenderer, func : Gtk::TreeCellDataFunc) : Int32
      # gtk_tree_view_insert_column_with_data_func: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if func
        _box = ::Box.box(func)
        func = ->(lib_tree_column : Pointer(Void), lib_cell : Pointer(Void), lib_tree_model : Pointer(Void), lib_iter : Pointer(Void), lib_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          tree_column = Gtk::TreeViewColumn.new(lib_tree_column, :none)
          # Generator::BuiltInTypeArgPlan
          cell = Gtk::CellRenderer.new(lib_cell, :none)
          # Generator::BuiltInTypeArgPlan
          tree_model = Gtk::TreeModel.new(lib_tree_model, :none)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          ::Box(Proc(Gtk::TreeViewColumn, Gtk::CellRenderer, Gtk::TreeModel, Gtk::TreeIter, Nil)).unbox(lib_data).call(tree_column, cell, tree_model, iter)
        }.pointer
        data = GICrystal::ClosureDataManager.register(_box)
        dnotify = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        func = data = dnotify = Pointer(Void).null
      end

      # C call
      _retval = LibGtk.gtk_tree_view_insert_column_with_data_func(@pointer, position, title, cell, func, data, dnotify)

      # Return value handling

      _retval
    end

    # Determine whether the point (@x, @y) in @tree_view is blank, that is no
    # cell content nor an expander arrow is drawn at the location. If so, the
    # location can be considered as the background. You might wish to take
    # special action on clicks on the background, such as clearing a current
    # selection, having a custom context menu or starting rubber banding.
    #
    # The @x and @y coordinate that are provided must be relative to bin_window
    # coordinates.  Widget-relative coordinates must be converted using
    # gtk_tree_view_convert_widget_to_bin_window_coords().
    #
    # For converting widget coordinates (eg. the ones you get from
    # GtkWidget::query-tooltip), please see
    # gtk_tree_view_convert_widget_to_bin_window_coords().
    #
    # The @path, @column, @cell_x and @cell_y arguments will be filled in
    # likewise as for gtk_tree_view_get_path_at_pos().  Please see
    # gtk_tree_view_get_path_at_pos() for more information.
    def is_blank_at_pos(x : Int32, y : Int32) : Bool
      # gtk_tree_view_is_blank_at_pos: (Method)
      # @path: (out) (transfer full) (nullable) (optional)
      # @column: (out) (nullable) (optional)
      # @cell_x: (out) (transfer full) (optional)
      # @cell_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      path = Pointer(Pointer(Void)).null   # Generator::OutArgUsedInReturnPlan
      column = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      cell_x = Pointer(Int32).null         # Generator::OutArgUsedInReturnPlan
      cell_y = Pointer(Int32).null
      # C call
      _retval = LibGtk.gtk_tree_view_is_blank_at_pos(@pointer, x, y, path, column, cell_x, cell_y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether a rubber banding operation is currently being done
    # in @tree_view.
    def is_rubber_banding_active : Bool
      # gtk_tree_view_is_rubber_banding_active: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_is_rubber_banding_active(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Calls @func on all expanded rows.
    def map_expanded_rows(func : Gtk::TreeViewMappingFunc, data : Pointer(Void)?) : Nil
      # gtk_tree_view_map_expanded_rows: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGtk.gtk_tree_view_map_expanded_rows(@pointer, func, data)

      # Return value handling
    end

    # Moves @column to be after to @base_column.  If @base_column is %NULL, then
    # @column is placed in the first position.
    def move_column_after(column : Gtk::TreeViewColumn, base_column : Gtk::TreeViewColumn?) : Nil
      # gtk_tree_view_move_column_after: (Method)
      # @base_column: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      base_column = if base_column.nil?
                      Pointer(Void).null
                    else
                      base_column.to_unsafe
                    end

      # C call
      LibGtk.gtk_tree_view_move_column_after(@pointer, column, base_column)

      # Return value handling
    end

    # Removes @column from @tree_view.
    def remove_column(column : Gtk::TreeViewColumn) : Int32
      # gtk_tree_view_remove_column: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_remove_column(@pointer, column)

      # Return value handling

      _retval
    end

    # Activates the cell determined by @path and @column.
    def row_activated(path : Gtk::TreePath, column : Gtk::TreeViewColumn?) : Nil
      # gtk_tree_view_row_activated: (Method)
      # @column: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end

      # C call
      LibGtk.gtk_tree_view_row_activated(@pointer, path, column)

      # Return value handling
    end

    # Returns %TRUE if the node pointed to by @path is expanded in @tree_view.
    def row_expanded(path : Gtk::TreePath) : Bool
      # gtk_tree_view_row_expanded: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_row_expanded(@pointer, path)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Moves the alignments of @tree_view to the position specified by @column and
    # @path.  If @column is %NULL, then no horizontal scrolling occurs.  Likewise,
    # if @path is %NULL no vertical scrolling occurs.  At a minimum, one of @column
    # or @path need to be non-%NULL.  @row_align determines where the row is
    # placed, and @col_align determines where @column is placed.  Both are expected
    # to be between 0.0 and 1.0. 0.0 means left/top alignment, 1.0 means
    # right/bottom alignment, 0.5 means center.
    #
    # If @use_align is %FALSE, then the alignment arguments are ignored, and the
    # tree does the minimum amount of work to scroll the cell onto the screen.
    # This means that the cell will be scrolled to the edge closest to its current
    # position.  If the cell is currently visible on the screen, nothing is done.
    #
    # This function only works if the model is set, and @path is a valid row on the
    # model.  If the model changes before the @tree_view is realized, the centered
    # path will be modified to reflect this change.
    def scroll_to_cell(path : Gtk::TreePath?, column : Gtk::TreeViewColumn?, use_align : Bool, row_align : Float32, col_align : Float32) : Nil
      # gtk_tree_view_scroll_to_cell: (Method)
      # @path: (nullable)
      # @column: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end
      # Generator::NullableArrayPlan
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end

      # C call
      LibGtk.gtk_tree_view_scroll_to_cell(@pointer, path, column, use_align, row_align, col_align)

      # Return value handling
    end

    # Scrolls the tree view such that the top-left corner of the visible
    # area is @tree_x, @tree_y, where @tree_x and @tree_y are specified
    # in tree coordinates.  The @tree_view must be realized before
    # this function is called.  If it isn't, you probably want to be
    # using gtk_tree_view_scroll_to_cell().
    #
    # If either @tree_x or @tree_y are -1, then that direction isn’t scrolled.
    def scroll_to_point(tree_x : Int32, tree_y : Int32) : Nil
      # gtk_tree_view_scroll_to_point: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_scroll_to_point(@pointer, tree_x, tree_y)

      # Return value handling
    end

    # Cause the `GtkTreeView`::row-activated signal to be emitted
    # on a single click instead of a double click.
    def activate_on_single_click=(single : Bool) : Nil
      # gtk_tree_view_set_activate_on_single_click: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_activate_on_single_click(@pointer, single)

      # Return value handling
    end

    # Sets a user function for determining where a column may be dropped when
    # dragged.  This function is called on every column pair in turn at the
    # beginning of a column drag to determine where a drop can take place.  The
    # arguments passed to @func are: the @tree_view, the `GtkTreeViewColumn` being
    # dragged, the two `GtkTreeViewColumn`s determining the drop spot, and
    # @user_data.  If either of the `GtkTreeViewColumn` arguments for the drop spot
    # are %NULL, then they indicate an edge.  If @func is set to be %NULL, then
    # @tree_view reverts to the default behavior of allowing all columns to be
    # dropped everywhere.
    def column_drag_function=(func : Gtk::TreeViewColumnDropFunc?) : Nil
      # gtk_tree_view_set_column_drag_function: (Method)
      # @func: (nullable)
      # @user_data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if func
        _box = ::Box.box(func)
        func = ->(lib_tree_view : Pointer(Void), lib_column : Pointer(Void), lib_prev_column : Pointer(Void), lib_next_column : Pointer(Void), lib_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          tree_view = Gtk::TreeView.new(lib_tree_view, :none)
          # Generator::BuiltInTypeArgPlan
          column = Gtk::TreeViewColumn.new(lib_column, :none)
          # Generator::BuiltInTypeArgPlan
          prev_column = Gtk::TreeViewColumn.new(lib_prev_column, :none)
          # Generator::BuiltInTypeArgPlan
          next_column = Gtk::TreeViewColumn.new(lib_next_column, :none)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeViewColumn, Gtk::TreeViewColumn, Gtk::TreeViewColumn, Bool)).unbox(lib_data).call(tree_view, column, prev_column, next_column)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        func = user_data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_tree_view_set_column_drag_function(@pointer, func, user_data, destroy)

      # Return value handling
    end

    # Sets the current keyboard focus to be at @path, and selects it.  This is
    # useful when you want to focus the user’s attention on a particular row.  If
    # @focus_column is not %NULL, then focus is given to the column specified by
    # it. Additionally, if @focus_column is specified, and @start_editing is
    # %TRUE, then editing should be started in the specified cell.
    # This function is often followed by @gtk_widget_grab_focus (@tree_view)
    # in order to give keyboard focus to the widget.  Please note that editing
    # can only happen when the widget is realized.
    #
    # If @path is invalid for @model, the current cursor (if any) will be unset
    # and the function will return without failing.
    def set_cursor(path : Gtk::TreePath, focus_column : Gtk::TreeViewColumn?, start_editing : Bool) : Nil
      # gtk_tree_view_set_cursor: (Method)
      # @focus_column: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      focus_column = if focus_column.nil?
                       Pointer(Void).null
                     else
                       focus_column.to_unsafe
                     end

      # C call
      LibGtk.gtk_tree_view_set_cursor(@pointer, path, focus_column, start_editing)

      # Return value handling
    end

    # Sets the current keyboard focus to be at @path, and selects it.  This is
    # useful when you want to focus the user’s attention on a particular row.  If
    # @focus_column is not %NULL, then focus is given to the column specified by
    # it. If @focus_column and @focus_cell are not %NULL, and @focus_column
    # contains 2 or more editable or activatable cells, then focus is given to
    # the cell specified by @focus_cell. Additionally, if @focus_column is
    # specified, and @start_editing is %TRUE, then editing should be started in
    # the specified cell.  This function is often followed by
    # @gtk_widget_grab_focus (@tree_view) in order to give keyboard focus to the
    # widget.  Please note that editing can only happen when the widget is
    # realized.
    #
    # If @path is invalid for @model, the current cursor (if any) will be unset
    # and the function will return without failing.
    def set_cursor_on_cell(path : Gtk::TreePath, focus_column : Gtk::TreeViewColumn?, focus_cell : Gtk::CellRenderer?, start_editing : Bool) : Nil
      # gtk_tree_view_set_cursor_on_cell: (Method)
      # @focus_column: (nullable)
      # @focus_cell: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      focus_column = if focus_column.nil?
                       Pointer(Void).null
                     else
                       focus_column.to_unsafe
                     end
      # Generator::NullableArrayPlan
      focus_cell = if focus_cell.nil?
                     Pointer(Void).null
                   else
                     focus_cell.to_unsafe
                   end

      # C call
      LibGtk.gtk_tree_view_set_cursor_on_cell(@pointer, path, focus_column, focus_cell, start_editing)

      # Return value handling
    end

    # Sets the row that is highlighted for feedback.
    # If @path is %NULL, an existing highlight is removed.
    def set_drag_dest_row(path : Gtk::TreePath?, pos : Gtk::TreeViewDropPosition) : Nil
      # gtk_tree_view_set_drag_dest_row: (Method)
      # @path: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end

      # C call
      LibGtk.gtk_tree_view_set_drag_dest_row(@pointer, path, pos)

      # Return value handling
    end

    # If @enable_search is set, then the user can type in text to search through
    # the tree interactively (this is sometimes called "typeahead find").
    #
    # Note that even if this is %FALSE, the user can still initiate a search
    # using the “start-interactive-search” key binding.
    def enable_search=(enable_search : Bool) : Nil
      # gtk_tree_view_set_enable_search: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_enable_search(@pointer, enable_search)

      # Return value handling
    end

    # Sets whether to draw lines interconnecting the expanders in @tree_view.
    # This does not have any visible effects for lists.
    def enable_tree_lines=(enabled : Bool) : Nil
      # gtk_tree_view_set_enable_tree_lines: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_enable_tree_lines(@pointer, enabled)

      # Return value handling
    end

    # Sets the column to draw the expander arrow at. It must be in @tree_view.
    # If @column is %NULL, then the expander arrow is always at the first
    # visible column.
    #
    # If you do not want expander arrow to appear in your tree, set the
    # expander column to a hidden column.
    def expander_column=(column : Gtk::TreeViewColumn?) : Nil
      # gtk_tree_view_set_expander_column: (Method | Setter)
      # @column: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end

      # C call
      LibGtk.gtk_tree_view_set_expander_column(@pointer, column)

      # Return value handling
    end

    # Enables or disables the fixed height mode of @tree_view.
    # Fixed height mode speeds up `GtkTreeView` by assuming that all
    # rows have the same height.
    # Only enable this option if all rows are the same height and all
    # columns are of type %GTK_TREE_VIEW_COLUMN_FIXED.
    def fixed_height_mode=(enable : Bool) : Nil
      # gtk_tree_view_set_fixed_height_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_fixed_height_mode(@pointer, enable)

      # Return value handling
    end

    # Sets which grid lines to draw in @tree_view.
    def grid_lines=(grid_lines : Gtk::TreeViewGridLines) : Nil
      # gtk_tree_view_set_grid_lines: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_grid_lines(@pointer, grid_lines)

      # Return value handling
    end

    # Allow the column title buttons to be clicked.
    def headers_clickable=(setting : Bool) : Nil
      # gtk_tree_view_set_headers_clickable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_headers_clickable(@pointer, setting)

      # Return value handling
    end

    # Sets the visibility state of the headers.
    def headers_visible=(headers_visible : Bool) : Nil
      # gtk_tree_view_set_headers_visible: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_headers_visible(@pointer, headers_visible)

      # Return value handling
    end

    # Enables or disables the hover expansion mode of @tree_view.
    # Hover expansion makes rows expand or collapse if the pointer
    # moves over them.
    def hover_expand=(expand : Bool) : Nil
      # gtk_tree_view_set_hover_expand: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_hover_expand(@pointer, expand)

      # Return value handling
    end

    # Enables or disables the hover selection mode of @tree_view.
    # Hover selection makes the selected row follow the pointer.
    # Currently, this works only for the selection modes
    # %GTK_SELECTION_SINGLE and %GTK_SELECTION_BROWSE.
    def hover_selection=(hover : Bool) : Nil
      # gtk_tree_view_set_hover_selection: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_hover_selection(@pointer, hover)

      # Return value handling
    end

    # Sets the amount of extra indentation for child levels to use in @tree_view
    # in addition to the default indentation.  The value should be specified in
    # pixels, a value of 0 disables this feature and in this case only the default
    # indentation will be used.
    # This does not have any visible effects for lists.
    def level_indentation=(indentation : Int32) : Nil
      # gtk_tree_view_set_level_indentation: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_level_indentation(@pointer, indentation)

      # Return value handling
    end

    # Sets the model for a `GtkTreeView`.  If the @tree_view already has a model
    # set, it will remove it before setting the new model.  If @model is %NULL,
    # then it will unset the old model.
    def model=(model : Gtk::TreeModel?) : Nil
      # gtk_tree_view_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_tree_view_set_model(@pointer, model)

      # Return value handling
    end

    # This function is a convenience function to allow you to reorder
    # models that support the `GtkTreeDragSourceIface` and the
    # `GtkTreeDragDestIface`.  Both `GtkTreeStore` and `GtkListStore` support
    # these.  If @reorderable is %TRUE, then the user can reorder the
    # model by dragging and dropping rows. The developer can listen to
    # these changes by connecting to the model’s `GtkTreeModel::row-inserted`
    # and `GtkTreeModel::row-deleted` signals. The reordering is implemented
    # by setting up the tree view as a drag source and destination.
    # Therefore, drag and drop can not be used in a reorderable view for any
    # other purpose.
    #
    # This function does not give you any degree of control over the order -- any
    # reordering is allowed.  If more control is needed, you should probably
    # handle drag and drop manually.
    def reorderable=(reorderable : Bool) : Nil
      # gtk_tree_view_set_reorderable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_reorderable(@pointer, reorderable)

      # Return value handling
    end

    # Sets the row separator function, which is used to determine
    # whether a row should be drawn as a separator. If the row separator
    # function is %NULL, no separators are drawn. This is the default value.
    def row_separator_func=(func : Gtk::TreeViewRowSeparatorFunc?) : Nil
      # gtk_tree_view_set_row_separator_func: (Method)
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
      LibGtk.gtk_tree_view_set_row_separator_func(@pointer, func, data, destroy)

      # Return value handling
    end

    # Enables or disables rubber banding in @tree_view.  If the selection mode
    # is %GTK_SELECTION_MULTIPLE, rubber banding will allow the user to select
    # multiple rows by dragging the mouse.
    def rubber_banding=(enable : Bool) : Nil
      # gtk_tree_view_set_rubber_banding: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_rubber_banding(@pointer, enable)

      # Return value handling
    end

    # Sets @column as the column where the interactive search code should
    # search in for the current model.
    #
    # If the search column is set, users can use the “start-interactive-search”
    # key binding to bring up search popup. The enable-search property controls
    # whether simply typing text will also start an interactive search.
    #
    # Note that @column refers to a column of the current model. The search
    # column is reset to -1 when the model is changed.
    def search_column=(column : Int32) : Nil
      # gtk_tree_view_set_search_column: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_search_column(@pointer, column)

      # Return value handling
    end

    # Sets the entry which the interactive search code will use for this
    # @tree_view.  This is useful when you want to provide a search entry
    # in our interface at all time at a fixed position.  Passing %NULL for
    # @entry will make the interactive search code use the built-in popup
    # entry again.
    def search_entry=(entry : Gtk::Editable?) : Nil
      # gtk_tree_view_set_search_entry: (Method)
      # @entry: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      entry = if entry.nil?
                Pointer(Void).null
              else
                entry.to_unsafe
              end

      # C call
      LibGtk.gtk_tree_view_set_search_entry(@pointer, entry)

      # Return value handling
    end

    # Sets the compare function for the interactive search capabilities; note
    # that somewhat like strcmp() returning 0 for equality
    # `GtkTreeView`SearchEqualFunc returns %FALSE on matches.
    def search_equal_func=(search_equal_func : Gtk::TreeViewSearchEqualFunc) : Nil
      # gtk_tree_view_set_search_equal_func: (Method)
      # @search_user_data: (nullable)
      # @search_destroy: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if search_equal_func
        _box = ::Box.box(search_equal_func)
        search_equal_func = ->(lib_model : Pointer(Void), lib_column : Int32, lib_key : Pointer(LibC::Char), lib_iter : Pointer(Void), lib_search_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          model = Gtk::TreeModel.new(lib_model, :none)
          column = lib_column
          # Generator::BuiltInTypeArgPlan
          key = ::String.new(lib_key)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          ::Box(Proc(Gtk::TreeModel, Int32, ::String, Gtk::TreeIter, Bool)).unbox(lib_search_data).call(model, column, key, iter)
        }.pointer
        search_user_data = GICrystal::ClosureDataManager.register(_box)
        search_destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        search_equal_func = search_user_data = search_destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_tree_view_set_search_equal_func(@pointer, search_equal_func, search_user_data, search_destroy)

      # Return value handling
    end

    # Sets whether to draw and enable expanders and indent child rows in
    # @tree_view.  When disabled there will be no expanders visible in trees
    # and there will be no way to expand and collapse rows by default.  Also
    # note that hiding the expanders will disable the default indentation.  You
    # can set a custom indentation in this case using
    # gtk_tree_view_set_level_indentation().
    # This does not have any visible effects for lists.
    def show_expanders=(enabled : Bool) : Nil
      # gtk_tree_view_set_show_expanders: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_show_expanders(@pointer, enabled)

      # Return value handling
    end

    # Sets the tip area of @tooltip to the area @path, @column and @cell have
    # in common.  For example if @path is %NULL and @column is set, the tip
    # area will be set to the full area covered by @column.  See also
    # gtk_tooltip_set_tip_area().
    #
    # Note that if @path is not specified and @cell is set and part of a column
    # containing the expander, the tooltip might not show and hide at the correct
    # position.  In such cases @path must be set to the current node under the
    # mouse cursor for this function to operate correctly.
    #
    # See also gtk_tree_view_set_tooltip_column() for a simpler alternative.
    def set_tooltip_cell(tooltip : Gtk::Tooltip, path : Gtk::TreePath?, column : Gtk::TreeViewColumn?, cell : Gtk::CellRenderer?) : Nil
      # gtk_tree_view_set_tooltip_cell: (Method)
      # @path: (nullable)
      # @column: (nullable)
      # @cell: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end
      # Generator::NullableArrayPlan
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end
      # Generator::NullableArrayPlan
      cell = if cell.nil?
               Pointer(Void).null
             else
               cell.to_unsafe
             end

      # C call
      LibGtk.gtk_tree_view_set_tooltip_cell(@pointer, tooltip, path, column, cell)

      # Return value handling
    end

    # If you only plan to have simple (text-only) tooltips on full rows, you
    # can use this function to have `GtkTreeView` handle these automatically
    # for you. @column should be set to the column in @tree_view’s model
    # containing the tooltip texts, or -1 to disable this feature.
    #
    # When enabled, `GtkWidget:has-tooltip` will be set to %TRUE and
    # @tree_view will connect a `GtkWidget::query-tooltip` signal handler.
    #
    # Note that the signal handler sets the text with gtk_tooltip_set_markup(),
    # so &, <, etc have to be escaped in the text.
    def tooltip_column=(column : Int32) : Nil
      # gtk_tree_view_set_tooltip_column: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_tooltip_column(@pointer, column)

      # Return value handling
    end

    # Sets the tip area of @tooltip to be the area covered by the row at @path.
    # See also gtk_tree_view_set_tooltip_column() for a simpler alternative.
    # See also gtk_tooltip_set_tip_area().
    def set_tooltip_row(tooltip : Gtk::Tooltip, path : Gtk::TreePath) : Nil
      # gtk_tree_view_set_tooltip_row: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_set_tooltip_row(@pointer, tooltip, path)

      # Return value handling
    end

    # Undoes the effect of
    # gtk_tree_view_enable_model_drag_dest(). Calling this method sets
    # `GtkTreeView`:reorderable to %FALSE.
    def unset_rows_drag_dest : Nil
      # gtk_tree_view_unset_rows_drag_dest: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_unset_rows_drag_dest(@pointer)

      # Return value handling
    end

    # Undoes the effect of
    # gtk_tree_view_enable_model_drag_source(). Calling this method sets
    # `GtkTreeView`:reorderable to %FALSE.
    def unset_rows_drag_source : Nil
      # gtk_tree_view_unset_rows_drag_source: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_unset_rows_drag_source(@pointer)

      # Return value handling
    end

    # The number of columns of the treeview has changed.
    struct ColumnsChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "columns-changed::#{@detail}" : "columns-changed"
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

      def connect(handler : Proc(Gtk::TreeView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "columns-changed")
      end
    end

    def columns_changed_signal
      ColumnsChangedSignal.new(self)
    end

    # The position of the cursor (focused cell) has changed.
    struct CursorChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "cursor-changed::#{@detail}" : "cursor-changed"
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

      def connect(handler : Proc(Gtk::TreeView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "cursor-changed")
      end
    end

    def cursor_changed_signal
      CursorChangedSignal.new(self)
    end

    struct ExpandCollapseCursorRowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "expand-collapse-cursor-row::#{@detail}" : "expand-collapse-cursor-row"
      end

      def connect(&block : Proc(Bool, Bool, Bool, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool, Bool, Bool, Bool))
        connect(block)
      end

      def connect(handler : Proc(Bool, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : LibC::Int, lib_p0 : LibC::Int, lib_p1 : LibC::Int, _lib_box : Pointer(Void)) {
          object = lib_object
          p0 = lib_p0
          p1 = lib_p1
          ::Box(Proc(Bool, Bool, Bool, Bool)).unbox(_lib_box).call(object, p0, p1)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Bool, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : LibC::Int, lib_p0 : LibC::Int, lib_p1 : LibC::Int, _lib_box : Pointer(Void)) {
          object = lib_object
          p0 = lib_p0
          p1 = lib_p1
          ::Box(Proc(Bool, Bool, Bool, Bool)).unbox(_lib_box).call(object, p0, p1)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TreeView, Bool, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : LibC::Int, lib_p0 : LibC::Int, lib_p1 : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          object = lib_object
          p0 = lib_p0
          p1 = lib_p1
          ::Box(Proc(Gtk::TreeView, Bool, Bool, Bool, Bool)).unbox(_lib_box).call(_sender, object, p0, p1)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Bool, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : LibC::Int, lib_p0 : LibC::Int, lib_p1 : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          object = lib_object
          p0 = lib_p0
          p1 = lib_p1
          ::Box(Proc(Gtk::TreeView, Bool, Bool, Bool, Bool)).unbox(_lib_box).call(_sender, object, p0, p1)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Bool, p0 : Bool, p1 : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "expand-collapse-cursor-row", object, p0, p1)
      end
    end

    def expand_collapse_cursor_row_signal
      ExpandCollapseCursorRowSignal.new(self)
    end

    # The `GtkTreeView`::move-cursor signal is a [keybinding
    # signal]`Gtk#SignalAction` which gets emitted when the user
    # presses one of the cursor keys.
    #
    # Applications should not connect to it, but may emit it with
    # g_signal_emit_by_name() if they need to control the cursor
    # programmatically. In contrast to gtk_tree_view_set_cursor() and
    # gtk_tree_view_set_cursor_on_cell() when moving horizontally
    # `GtkTreeView`::move-cursor does not reset the current selection.
    struct MoveCursorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "move-cursor::#{@detail}" : "move-cursor"
      end

      def connect(&block : Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_direction : Int32, lib__extend : LibC::Int, lib_modify : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          direction = lib_direction
          _extend = lib_extend
          modify = lib_modify
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(_lib_box).call(step, direction, _extend, modify)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_direction : Int32, lib__extend : LibC::Int, lib_modify : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          direction = lib_direction
          _extend = lib_extend
          modify = lib_modify
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(_lib_box).call(step, direction, _extend, modify)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TreeView, Gtk::MovementStep, Int32, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_direction : Int32, lib__extend : LibC::Int, lib_modify : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          direction = lib_direction
          _extend = lib_extend
          modify = lib_modify
          ::Box(Proc(Gtk::TreeView, Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(_lib_box).call(_sender, step, direction, _extend, modify)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Gtk::MovementStep, Int32, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_direction : Int32, lib__extend : LibC::Int, lib_modify : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          direction = lib_direction
          _extend = lib_extend
          modify = lib_modify
          ::Box(Proc(Gtk::TreeView, Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(_lib_box).call(_sender, step, direction, _extend, modify)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::MovementStep, direction : Int32, extend _extend : Bool, modify : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-cursor", step, direction, _extend, modify)
      end
    end

    def move_cursor_signal
      MoveCursorSignal.new(self)
    end

    # The "row-activated" signal is emitted when the method
    # [`method@Gtk.TreeView.row_activated`] is called.
    #
    # This signal is emitted when the user double-clicks a treeview row with the
    # [property@Gtk.TreeView:activate-on-single-click] property set to %FALSE,
    # or when the user single-clicks a row when that property set to %TRUE.
    #
    # This signal is also emitted when a non-editable row is selected and one
    # of the keys: <kbd>Space</kbd>, <kbd>Shift</kbd>+<kbd>Space</kbd>,
    # <kbd>Return</kbd> or <kbd>Enter</kbd> is pressed.
    #
    # For selection handling refer to the
    # [tree widget conceptual overview](section-tree-widget.html)
    # as well as `GtkTreeSelection`.
    struct RowActivatedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "row-activated::#{@detail}" : "row-activated"
      end

      def connect(&block : Proc(Gtk::TreePath, Gtk::TreeViewColumn?, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreePath, Gtk::TreeViewColumn?, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::TreePath, Gtk::TreeViewColumn?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(Void), lib_column : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          # Generator::NullableArrayPlan
          column = (lib_column.null? ? nil : Gtk::TreeViewColumn.new(lib_column, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          column = Gtk::TreeViewColumn.new(lib_column, :none) unless lib_column.null?
          ::Box(Proc(Gtk::TreePath, Gtk::TreeViewColumn?, Nil)).unbox(_lib_box).call(path, column)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreePath, Gtk::TreeViewColumn?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(Void), lib_column : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          # Generator::NullableArrayPlan
          column = (lib_column.null? ? nil : Gtk::TreeViewColumn.new(lib_column, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          column = Gtk::TreeViewColumn.new(lib_column, :none) unless lib_column.null?
          ::Box(Proc(Gtk::TreePath, Gtk::TreeViewColumn?, Nil)).unbox(_lib_box).call(path, column)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(Void), lib_column : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          # Generator::NullableArrayPlan
          column = (lib_column.null? ? nil : Gtk::TreeViewColumn.new(lib_column, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          column = Gtk::TreeViewColumn.new(lib_column, :none) unless lib_column.null?
          ::Box(Proc(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn?, Nil)).unbox(_lib_box).call(_sender, path, column)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(Void), lib_column : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          # Generator::NullableArrayPlan
          column = (lib_column.null? ? nil : Gtk::TreeViewColumn.new(lib_column, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          column = Gtk::TreeViewColumn.new(lib_column, :none) unless lib_column.null?
          ::Box(Proc(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn?, Nil)).unbox(_lib_box).call(_sender, path, column)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(path : Gtk::TreePath, column : Gtk::TreeViewColumn?) : Nil
        # Generator::NullableArrayPlan
        column = if column.nil?
                   Void.null
                 else
                   column.to_unsafe
                 end

        LibGObject.g_signal_emit_by_name(@source, "row-activated", path, column)
      end
    end

    def row_activated_signal
      RowActivatedSignal.new(self)
    end

    # The given row has been collapsed (child nodes are hidden).
    struct RowCollapsedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "row-collapsed::#{@detail}" : "row-collapsed"
      end

      def connect(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(_lib_box).call(iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(_lib_box).call(iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(_lib_box).call(_sender, iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(_lib_box).call(_sender, iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(iter : Gtk::TreeIter, path : Gtk::TreePath) : Nil
        LibGObject.g_signal_emit_by_name(@source, "row-collapsed", iter, path)
      end
    end

    def row_collapsed_signal
      RowCollapsedSignal.new(self)
    end

    # The given row has been expanded (child nodes are shown).
    struct RowExpandedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "row-expanded::#{@detail}" : "row-expanded"
      end

      def connect(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(_lib_box).call(iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(_lib_box).call(iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(_lib_box).call(_sender, iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(_lib_box).call(_sender, iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(iter : Gtk::TreeIter, path : Gtk::TreePath) : Nil
        LibGObject.g_signal_emit_by_name(@source, "row-expanded", iter, path)
      end
    end

    def row_expanded_signal
      RowExpandedSignal.new(self)
    end

    struct SelectAllSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "select-all::#{@detail}" : "select-all"
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

      def connect(handler : Proc(Gtk::TreeView, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-all")
      end
    end

    def select_all_signal
      SelectAllSignal.new(self)
    end

    struct SelectCursorParentSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "select-cursor-parent::#{@detail}" : "select-cursor-parent"
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

      def connect(handler : Proc(Gtk::TreeView, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-cursor-parent")
      end
    end

    def select_cursor_parent_signal
      SelectCursorParentSignal.new(self)
    end

    struct SelectCursorRowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "select-cursor-row::#{@detail}" : "select-cursor-row"
      end

      def connect(&block : Proc(Bool, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool, Bool))
        connect(block)
      end

      def connect(handler : Proc(Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : LibC::Int, _lib_box : Pointer(Void)) {
          object = lib_object
          ::Box(Proc(Bool, Bool)).unbox(_lib_box).call(object)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : LibC::Int, _lib_box : Pointer(Void)) {
          object = lib_object
          ::Box(Proc(Bool, Bool)).unbox(_lib_box).call(object)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TreeView, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          object = lib_object
          ::Box(Proc(Gtk::TreeView, Bool, Bool)).unbox(_lib_box).call(_sender, object)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          object = lib_object
          ::Box(Proc(Gtk::TreeView, Bool, Bool)).unbox(_lib_box).call(_sender, object)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-cursor-row", object)
      end
    end

    def select_cursor_row_signal
      SelectCursorRowSignal.new(self)
    end

    struct StartInteractiveSearchSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "start-interactive-search::#{@detail}" : "start-interactive-search"
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

      def connect(handler : Proc(Gtk::TreeView, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "start-interactive-search")
      end
    end

    def start_interactive_search_signal
      StartInteractiveSearchSignal.new(self)
    end

    # The given row is about to be collapsed (hide its children nodes). Use this
    # signal if you need to control the collapsibility of individual rows.
    struct TestCollapseRowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "test-collapse-row::#{@detail}" : "test-collapse-row"
      end

      def connect(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(_lib_box).call(iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(_lib_box).call(iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(_lib_box).call(_sender, iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(_lib_box).call(_sender, iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(iter : Gtk::TreeIter, path : Gtk::TreePath) : Nil
        LibGObject.g_signal_emit_by_name(@source, "test-collapse-row", iter, path)
      end
    end

    def test_collapse_row_signal
      TestCollapseRowSignal.new(self)
    end

    # The given row is about to be expanded (show its children nodes). Use this
    # signal if you need to control the expandability of individual rows.
    struct TestExpandRowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "test-expand-row::#{@detail}" : "test-expand-row"
      end

      def connect(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(_lib_box).call(iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(_lib_box).call(iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(_lib_box).call(_sender, iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_iter : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(_lib_box).call(_sender, iter, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(iter : Gtk::TreeIter, path : Gtk::TreePath) : Nil
        LibGObject.g_signal_emit_by_name(@source, "test-expand-row", iter, path)
      end
    end

    def test_expand_row_signal
      TestExpandRowSignal.new(self)
    end

    struct ToggleCursorRowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "toggle-cursor-row::#{@detail}" : "toggle-cursor-row"
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

      def connect(handler : Proc(Gtk::TreeView, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggle-cursor-row")
      end
    end

    def toggle_cursor_row_signal
      ToggleCursorRowSignal.new(self)
    end

    struct UnselectAllSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "unselect-all::#{@detail}" : "unselect-all"
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

      def connect(handler : Proc(Gtk::TreeView, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeView, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "unselect-all")
      end
    end

    def unselect_all_signal
      UnselectAllSignal.new(self)
    end
  end
end
