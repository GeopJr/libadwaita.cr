require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkFrame` is a widget that surrounds its child with a decorative
  # frame and an optional label.
  #
  # ![An example GtkFrame](frame.png)
  #
  # If present, the label is drawn inside the top edge of the frame.
  # The horizontal position of the label can be controlled with
  # [method@Gtk.Frame.set_label_align].
  #
  # `GtkFrame` clips its child. You can use this to add rounded corners
  # to widgets, but be aware that it also cuts off shadows.
  #
  # # GtkFrame as GtkBuildable
  #
  # The `GtkFrame` implementation of the `GtkBuildable` interface supports
  # placing a child in the label position by specifying “label” as the
  # “type” attribute of a <child> element. A normal content child can
  # be specified without specifying a <child> type attribute.
  #
  # An example of a UI definition fragment with GtkFrame:
  # ```xml
  # <object class="GtkFrame">
  #   <child type="label">
  #     <object class="GtkLabel" id="frame_label"/>
  #   </child>
  #   <child>
  #     <object class="GtkEntry" id="frame_content"/>
  #   </child>
  # </object>
  # ```
  #
  # # CSS nodes
  #
  # ```
  # frame
  # ├── <label widget>
  # ╰── <child>
  # ```
  #
  # `GtkFrame` has a main CSS node with name “frame”, which is used to draw the
  # visible border. You can set the appearance of the border using CSS properties
  # like “border-style” on this node.
  class Frame < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, label : ::String? = nil, label_widget : Gtk::Widget? = nil, label_xalign : Float32? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[39]
      _values = StaticArray(LibGObject::Value, 39).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
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
      if label
        (_names.to_unsafe + _n).value = "label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, label)
        _n += 1
      end
      if label_widget
        (_names.to_unsafe + _n).value = "label-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, label_widget)
        _n += 1
      end
      if label_xalign
        (_names.to_unsafe + _n).value = "label-xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, label_xalign)
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

      @pointer = LibGObject.g_object_new_with_properties(Frame.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_frame_get_type
    end

    def initialize(label : ::String?)
      # gtk_frame_new: (Constructor)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      _retval = LibGtk.gtk_frame_new(label)
      @pointer = _retval
    end

    def child : Gtk::Widget?
      # gtk_frame_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_frame_get_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def label : ::String?
      # gtk_frame_get_label: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_frame_get_label(self)
      ::String.new(_retval) unless _retval.null?
    end

    def label_align : Float32
      # gtk_frame_get_label_align: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_frame_get_label_align(self)
      _retval
    end

    def label_widget : Gtk::Widget?
      # gtk_frame_get_label_widget: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_frame_get_label_widget(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def child=(child : Gtk::Widget?) : Nil
      # gtk_frame_set_child: (Method)
      # @child: (nullable)
      # Returns: (transfer none)

      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      LibGtk.gtk_frame_set_child(self, child)
    end

    def label=(label : ::String?) : Nil
      # gtk_frame_set_label: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      LibGtk.gtk_frame_set_label(self, label)
    end

    def label_align=(xalign : Float32) : Nil
      # gtk_frame_set_label_align: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_frame_set_label_align(self, xalign)
    end

    def label_widget=(label_widget : Gtk::Widget?) : Nil
      # gtk_frame_set_label_widget: (Method)
      # @label_widget: (nullable)
      # Returns: (transfer none)

      label_widget = if label_widget.nil?
                       Pointer(Void).null
                     else
                       label_widget.to_unsafe
                     end

      LibGtk.gtk_frame_set_label_widget(self, label_widget)
    end
  end
end
