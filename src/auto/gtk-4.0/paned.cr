require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./orientable"

module Gtk
  # A widget with two panes, arranged either horizontally or vertically.
  #
  # ![An example GtkPaned](panes.png)
  #
  # The division between the two panes is adjustable by the user
  # by dragging a handle.
  #
  # Child widgets are added to the panes of the widget with
  # `Gtk::Paned#start_child=` and `Gtk::Paned#end_child=`.
  # The division between the two children is set by default from the size
  # requests of the children, but it can be adjusted by the user.
  #
  # A paned widget draws a separator between the two child widgets and a
  # small handle that the user can drag to adjust the division. It does not
  # draw any relief around the children or around the separator. (The space
  # in which the separator is called the gutter.) Often, it is useful to put
  # each child inside a `Gtk#Frame` so that the gutter appears as a
  # ridge. No separator is drawn if one of the children is missing.
  #
  # Each child has two options that can be set, "resize" and "shrink". If
  # "resize" is true then, when the `GtkPaned` is resized, that child will
  # expand or shrink along with the paned widget. If "shrink" is true, then
  # that child can be made smaller than its requisition by the user.
  # Setting "shrink" to false allows the application to set a minimum size.
  # If "resize" is false for both children, then this is treated as if
  # "resize" is true for both children.
  #
  # The application can set the position of the slider as if it were set
  # by the user, by calling `Gtk::Paned#position=`.
  #
  # # CSS nodes
  #
  # ```
  # paned
  # ├── <child>
  # ├── separator[.wide]
  # ╰── <child>
  # ```
  #
  # `GtkPaned` has a main CSS node with name paned, and a subnode for
  # the separator with name separator. The subnode gets a .wide style
  # class when the paned is supposed to be wide.
  #
  # In horizontal orientation, the nodes are arranged based on the text
  # direction, so in left-to-right mode, :first-child will select the
  # leftmost child, while it will select the rightmost child in
  # RTL layouts.
  #
  # ## Creating a paned widget with minimum sizes.
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # GtkWidget *hpaned = gtk_paned_new (GTK_ORIENTATION_HORIZONTAL);
  # GtkWidget *frame1 = gtk_frame_new (NULL);
  # GtkWidget *frame2 = gtk_frame_new (NULL);
  #
  # gtk_widget_set_size_request (hpaned, 200, -1);
  #
  # gtk_paned_set_start_child (GTK_PANED (hpaned), frame1);
  # gtk_paned_set_start_child_resize (GTK_PANED (hpaned), TRUE);
  # gtk_paned_set_start_child_shrink (GTK_PANED (hpaned), FALSE);
  # gtk_widget_set_size_request (frame1, 50, -1);
  #
  # gtk_paned_set_end_child (GTK_PANED (hpaned), frame2);
  # gtk_paned_set_end_child_resize (GTK_PANED (hpaned), FALSE);
  # gtk_paned_set_end_child_shrink (GTK_PANED (hpaned), FALSE);
  # gtk_widget_set_size_request (frame2, 50, -1);
  # ```
  @[GObject::GeneratedWrapper]
  class Paned < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(Paned, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Paned`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, end_child : Gtk::Widget? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_position : Int32? = nil, min_position : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, position : Int32? = nil, position_set : Bool? = nil, receives_default : Bool? = nil, resize_end_child : Bool? = nil, resize_start_child : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, shrink_end_child : Bool? = nil, shrink_start_child : Bool? = nil, start_child : Gtk::Widget? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, wide_handle : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[47]
      _values = StaticArray(LibGObject::Value, 47).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
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
      if !end_child.nil?
        (_names.to_unsafe + _n).value = "end-child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, end_child)
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
      if !max_position.nil?
        (_names.to_unsafe + _n).value = "max-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_position)
        _n += 1
      end
      if !min_position.nil?
        (_names.to_unsafe + _n).value = "min-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_position)
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
      if !orientation.nil?
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
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
      if !position.nil?
        (_names.to_unsafe + _n).value = "position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, position)
        _n += 1
      end
      if !position_set.nil?
        (_names.to_unsafe + _n).value = "position-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, position_set)
        _n += 1
      end
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !resize_end_child.nil?
        (_names.to_unsafe + _n).value = "resize-end-child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resize_end_child)
        _n += 1
      end
      if !resize_start_child.nil?
        (_names.to_unsafe + _n).value = "resize-start-child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resize_start_child)
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
      if !shrink_end_child.nil?
        (_names.to_unsafe + _n).value = "shrink-end-child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, shrink_end_child)
        _n += 1
      end
      if !shrink_start_child.nil?
        (_names.to_unsafe + _n).value = "shrink-start-child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, shrink_start_child)
        _n += 1
      end
      if !start_child.nil?
        (_names.to_unsafe + _n).value = "start-child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, start_child)
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
      if !wide_handle.nil?
        (_names.to_unsafe + _n).value = "wide-handle".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wide_handle)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Paned.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_paned_get_type
    end

    def end_child=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "end-child", unsafe_value, Pointer(Void).null)
      value
    end

    def end_child : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "end-child", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def max_position : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-position", pointerof(value), Pointer(Void).null)
      value
    end

    def min_position : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "min-position", pointerof(value), Pointer(Void).null)
      value
    end

    def position=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "position", unsafe_value, Pointer(Void).null)
      value
    end

    def position : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "position", pointerof(value), Pointer(Void).null)
      value
    end

    def position_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "position-set", unsafe_value, Pointer(Void).null)
      value
    end

    def position_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "position-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def resize_end_child=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "resize-end-child", unsafe_value, Pointer(Void).null)
      value
    end

    def resize_end_child? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "resize-end-child", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def resize_start_child=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "resize-start-child", unsafe_value, Pointer(Void).null)
      value
    end

    def resize_start_child? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "resize-start-child", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def shrink_end_child=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "shrink-end-child", unsafe_value, Pointer(Void).null)
      value
    end

    def shrink_end_child? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "shrink-end-child", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def shrink_start_child=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "shrink-start-child", unsafe_value, Pointer(Void).null)
      value
    end

    def shrink_start_child? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "shrink-start-child", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def start_child=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "start-child", unsafe_value, Pointer(Void).null)
      value
    end

    def start_child : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "start-child", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def wide_handle=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "wide-handle", unsafe_value, Pointer(Void).null)
      value
    end

    def wide_handle? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "wide-handle", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new `GtkPaned` widget.
    def self.new(orientation : Gtk::Orientation) : self
      # gtk_paned_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paned_new(orientation)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::Paned.new(_retval, GICrystal::Transfer::Full)
    end

    # Retrieves the end child of the given `GtkPaned`.
    def end_child : Gtk::Widget?
      # gtk_paned_get_end_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paned_get_end_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Obtains the position of the divider between the two panes.
    def position : Int32
      # gtk_paned_get_position: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paned_get_position(@pointer)

      # Return value handling

      _retval
    end

    # Returns whether the [property@Gtk.Paned:end-child] can be resized.
    def resize_end_child : Bool
      # gtk_paned_get_resize_end_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paned_get_resize_end_child(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the [property@Gtk.Paned:start-child] can be resized.
    def resize_start_child : Bool
      # gtk_paned_get_resize_start_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paned_get_resize_start_child(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the [property@Gtk.Paned:end-child] can shrink.
    def shrink_end_child : Bool
      # gtk_paned_get_shrink_end_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paned_get_shrink_end_child(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the [property@Gtk.Paned:start-child] can shrink.
    def shrink_start_child : Bool
      # gtk_paned_get_shrink_start_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paned_get_shrink_start_child(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the start child of the given `GtkPaned`.
    def start_child : Gtk::Widget?
      # gtk_paned_get_start_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paned_get_start_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether the separator should be wide.
    def wide_handle : Bool
      # gtk_paned_get_wide_handle: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paned_get_wide_handle(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the end child of @paned to @child.
    #
    # If @child is `NULL`, the existing child will be removed.
    def end_child=(child : Gtk::Widget?) : Nil
      # gtk_paned_set_end_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_paned_set_end_child(@pointer, child)

      # Return value handling
    end

    # Sets the position of the divider between the two panes.
    def position=(position : Int32) : Nil
      # gtk_paned_set_position: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_paned_set_position(@pointer, position)

      # Return value handling
    end

    # Sets whether the [property@Gtk.Paned:end-child] can be resized.
    def resize_end_child=(resize : Bool) : Nil
      # gtk_paned_set_resize_end_child: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_paned_set_resize_end_child(@pointer, resize)

      # Return value handling
    end

    # Sets whether the [property@Gtk.Paned:start-child] can be resized.
    def resize_start_child=(resize : Bool) : Nil
      # gtk_paned_set_resize_start_child: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_paned_set_resize_start_child(@pointer, resize)

      # Return value handling
    end

    # Sets whether the [property@Gtk.Paned:end-child] can shrink.
    def shrink_end_child=(resize : Bool) : Nil
      # gtk_paned_set_shrink_end_child: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_paned_set_shrink_end_child(@pointer, resize)

      # Return value handling
    end

    # Sets whether the [property@Gtk.Paned:start-child] can shrink.
    def shrink_start_child=(resize : Bool) : Nil
      # gtk_paned_set_shrink_start_child: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_paned_set_shrink_start_child(@pointer, resize)

      # Return value handling
    end

    # Sets the start child of @paned to @child.
    #
    # If @child is `NULL`, the existing child will be removed.
    def start_child=(child : Gtk::Widget?) : Nil
      # gtk_paned_set_start_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_paned_set_start_child(@pointer, child)

      # Return value handling
    end

    # Sets whether the separator should be wide.
    def wide_handle=(wide : Bool) : Nil
      # gtk_paned_set_wide_handle: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_paned_set_wide_handle(@pointer, wide)

      # Return value handling
    end

    # Emitted to accept the current position of the handle when
    # moving it using key bindings.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default binding for this signal is <kbd>Return</kbd> or
    # <kbd>Space</kbd>.
    struct AcceptPositionSignal < GObject::Signal
      def name : String
        @detail ? "accept-position::#{@detail}" : "accept-position"
      end

      def connect(*, after : Bool = false, &block : Proc(Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Paned, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Paned.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Paned, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "accept-position")
      end
    end

    def accept_position_signal
      AcceptPositionSignal.new(self)
    end

    # Emitted to cancel moving the position of the handle using key
    # bindings.
    #
    # The position of the handle will be reset to the value prior to
    # moving it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default binding for this signal is <kbd>Escape</kbd>.
    struct CancelPositionSignal < GObject::Signal
      def name : String
        @detail ? "cancel-position::#{@detail}" : "cancel-position"
      end

      def connect(*, after : Bool = false, &block : Proc(Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Paned, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Paned.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Paned, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "cancel-position")
      end
    end

    def cancel_position_signal
      CancelPositionSignal.new(self)
    end

    # Emitted to cycle the focus between the children of the paned.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default binding is <kbd>F6</kbd>.
    struct CycleChildFocusSignal < GObject::Signal
      def name : String
        @detail ? "cycle-child-focus::#{@detail}" : "cycle-child-focus"
      end

      def connect(*, after : Bool = false, &block : Proc(Bool, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_reversed : LibC::Int, _lib_box : Pointer(Void)) {
          reversed = lib_reversed
          ::Box(Proc(Bool, Bool)).unbox(_lib_box).call(reversed)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Paned, Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_reversed : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::Paned.new(_lib_sender, GICrystal::Transfer::None)
          reversed = lib_reversed
          ::Box(Proc(Gtk::Paned, Bool, Bool)).unbox(_lib_box).call(_sender, reversed)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(reversed : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "cycle-child-focus", reversed)
      end
    end

    def cycle_child_focus_signal
      CycleChildFocusSignal.new(self)
    end

    # Emitted to cycle whether the paned should grab focus to allow
    # the user to change position of the handle by using key bindings.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default binding for this signal is <kbd>F8</kbd>.
    struct CycleHandleFocusSignal < GObject::Signal
      def name : String
        @detail ? "cycle-handle-focus::#{@detail}" : "cycle-handle-focus"
      end

      def connect(*, after : Bool = false, &block : Proc(Bool, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_reversed : LibC::Int, _lib_box : Pointer(Void)) {
          reversed = lib_reversed
          ::Box(Proc(Bool, Bool)).unbox(_lib_box).call(reversed)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Paned, Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_reversed : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::Paned.new(_lib_sender, GICrystal::Transfer::None)
          reversed = lib_reversed
          ::Box(Proc(Gtk::Paned, Bool, Bool)).unbox(_lib_box).call(_sender, reversed)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(reversed : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "cycle-handle-focus", reversed)
      end
    end

    def cycle_handle_focus_signal
      CycleHandleFocusSignal.new(self)
    end

    # Emitted to move the handle with key bindings.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    struct MoveHandleSignal < GObject::Signal
      def name : String
        @detail ? "move-handle::#{@detail}" : "move-handle"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::ScrollType, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::ScrollType, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll_type : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          scroll_type = Gtk::ScrollType.new(lib_scroll_type)
          ::Box(Proc(Gtk::ScrollType, Bool)).unbox(_lib_box).call(scroll_type)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Paned, Gtk::ScrollType, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll_type : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Paned.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          scroll_type = Gtk::ScrollType.new(lib_scroll_type)
          ::Box(Proc(Gtk::Paned, Gtk::ScrollType, Bool)).unbox(_lib_box).call(_sender, scroll_type)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(scroll_type : Gtk::ScrollType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-handle", scroll_type)
      end
    end

    def move_handle_signal
      MoveHandleSignal.new(self)
    end

    # Emitted to accept the current position of the handle and then
    # move focus to the next widget in the focus chain.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default binding is <kbd>Tab</kbd>.
    struct ToggleHandleFocusSignal < GObject::Signal
      def name : String
        @detail ? "toggle-handle-focus::#{@detail}" : "toggle-handle-focus"
      end

      def connect(*, after : Bool = false, &block : Proc(Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Paned, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Paned.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Paned, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggle-handle-focus")
      end
    end

    def toggle_handle_focus_signal
      ToggleHandleFocusSignal.new(self)
    end
  end
end
