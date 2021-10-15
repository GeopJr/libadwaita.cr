require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./orientable"

module Gtk
  # The `GtkBox` widget arranges child widgets into a single row or column.
  #
  # ![An example GtkBox](box.png)
  #
  # Whether it is a row or column depends on the value of its
  # [property@Gtk.Orientable:orientation] property. Within the other
  # dimension, all children are allocated the same size. Of course, the
  # [property@Gtk.Widget:halign] and [property@Gtk.Widget:valign] properties
  # can be used on the children to influence their allocation.
  #
  # Use repeated calls to [method@Gtk.Box.append] to pack widgets into a
  # `GtkBox` from start to end. Use [method@Gtk.Box.remove] to remove widgets
  # from the `GtkBox`. [method@Gtk.Box.insert_child_after] can be used to add
  # a child at a particular position.
  #
  # Use [method@Gtk.Box.set_homogeneous] to specify whether or not all children
  # of the `GtkBox` are forced to get the same amount of space.
  #
  # Use [method@Gtk.Box.set_spacing] to determine how much space will be minimally
  # placed between all children in the `GtkBox`. Note that spacing is added
  # *between* the children.
  #
  # Use [method@Gtk.Box.reorder_child_after] to move a child to a different
  # place in the box.
  #
  # # CSS nodes
  #
  # `GtkBox` uses a single CSS node with name box.
  #
  # # Accessibility
  #
  # `GtkBox` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
  class Box < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, baseline_position : Gtk::BaselinePosition? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, homogeneous : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, spacing : Int32? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[39]
      _values = StaticArray(LibGObject::Value, 39).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if baseline_position
        (_names.to_unsafe + _n).value = "baseline-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, baseline_position)
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
      if has_focus
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
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
      if homogeneous
        (_names.to_unsafe + _n).value = "homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, homogeneous)
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
      if orientation
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
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
      if spacing
        (_names.to_unsafe + _n).value = "spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, spacing)
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

      @pointer = LibGObject.g_object_new_with_properties(Box.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_box_get_type
    end

    def initialize(orientation : Gtk::Orientation, spacing : Int32)
      # gtk_box_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_box_new(orientation, spacing)
      @pointer = _retval
    end

    def append(child : Gtk::Widget) : Nil
      # gtk_box_append: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_box_append(self, child)
    end

    def baseline_position : Gtk::BaselinePosition
      # gtk_box_get_baseline_position: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_box_get_baseline_position(self)
      Gtk::BaselinePosition.from_value(_retval)
    end

    def homogeneous? : Bool
      # gtk_box_get_homogeneous: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_box_get_homogeneous(self)
      GICrystal.to_bool(_retval)
    end

    def spacing : Int32
      # gtk_box_get_spacing: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_box_get_spacing(self)
      _retval
    end

    def insert_child_after(child : Gtk::Widget, sibling : Gtk::Widget?) : Nil
      # gtk_box_insert_child_after: (Method)
      # @sibling: (nullable)
      # Returns: (transfer none)

      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end

      LibGtk.gtk_box_insert_child_after(self, child, sibling)
    end

    def prepend(child : Gtk::Widget) : Nil
      # gtk_box_prepend: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_box_prepend(self, child)
    end

    def remove(child : Gtk::Widget) : Nil
      # gtk_box_remove: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_box_remove(self, child)
    end

    def reorder_child_after(child : Gtk::Widget, sibling : Gtk::Widget?) : Nil
      # gtk_box_reorder_child_after: (Method)
      # @sibling: (nullable)
      # Returns: (transfer none)

      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end

      LibGtk.gtk_box_reorder_child_after(self, child, sibling)
    end

    def baseline_position=(position : Gtk::BaselinePosition) : Nil
      # gtk_box_set_baseline_position: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_box_set_baseline_position(self, position)
    end

    def homogeneous=(homogeneous : Bool) : Nil
      # gtk_box_set_homogeneous: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_box_set_homogeneous(self, homogeneous)
    end

    def spacing=(spacing : Int32) : Nil
      # gtk_box_set_spacing: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_box_set_spacing(self, spacing)
    end
  end
end
