require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkExpander` allows the user to reveal its child by clicking
  # on an expander triangle.
  #
  # ![An example GtkExpander](expander.png)
  #
  # This is similar to the triangles used in a `GtkTreeView`.
  #
  # Normally you use an expander as you would use a frame; you create
  # the child widget and use [method@Gtk.Expander.set_child] to add it
  # to the expander. When the expander is toggled, it will take care of
  # showing and hiding the child automatically.
  #
  # # Special Usage
  #
  # There are situations in which you may prefer to show and hide the
  # expanded widget yourself, such as when you want to actually create
  # the widget at expansion time. In this case, create a `GtkExpander`
  # but do not add a child to it. The expander widget has an
  # [property@Gtk.Expander:expanded[ property which can be used to
  # monitor its expansion state. You should watch this property with
  # a signal connection as follows:
  #
  # ```c
  # static void
  # expander_callback (GObject    *object,
  #                    GParamSpec *param_spec,
  #                    gpointer    user_data)
  # {
  #   GtkExpander *expander;
  #
  #   expander = GTK_EXPANDER (object);
  #
  #   if (gtk_expander_get_expanded (expander))
  #     {
  #       // Show or create widgets
  #     }
  #   else
  #     {
  #       // Hide or destroy widgets
  #     }
  # }
  #
  # static void
  # create_expander (void)
  # {
  #   GtkWidget *expander = gtk_expander_new_with_mnemonic ("_More Options");
  #   g_signal_connect (expander, "notify::expanded",
  #                     G_CALLBACK (expander_callback), NULL);
  #
  #   // ...
  # }
  # ```
  #
  # # GtkExpander as GtkBuildable
  #
  # The `GtkExpander` implementation of the `GtkBuildable` interface supports
  # placing a child in the label position by specifying “label” as the
  # “type” attribute of a <child> element. A normal content child can be
  # specified without specifying a <child> type attribute.
  #
  # An example of a UI definition fragment with GtkExpander:
  #
  # ```xml
  # <object class="GtkExpander">
  #   <child type="label">
  #     <object class="GtkLabel" id="expander-label"/>
  #   </child>
  #   <child>
  #     <object class="GtkEntry" id="expander-content"/>
  #   </child>
  # </object>
  # ```
  #
  # # CSS nodes
  #
  # ```
  # expander
  # ╰── box
  #     ├── title
  #     │   ├── arrow
  #     │   ╰── <label widget>
  #     ╰── <child>
  # ```
  #
  # `GtkExpander` has three CSS nodes, the main node with the name expander,
  # a subnode with name title and node below it with name arrow. The arrow of an
  # expander that is showing its child gets the :checked pseudoclass added to it.
  #
  # # Accessibility
  #
  # `GtkExpander` uses the %GTK_ACCESSIBLE_ROLE_BUTTON role.
  class Expander < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, expanded : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, label : ::String? = nil, label_widget : Gtk::Widget? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, resize_toplevel : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_markup : Bool? = nil, use_underline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[42]
      _values = StaticArray(LibGObject::Value, 42).new(LibGObject::Value.new)
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
      if expanded
        (_names.to_unsafe + _n).value = "expanded".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expanded)
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
      if resize_toplevel
        (_names.to_unsafe + _n).value = "resize-toplevel".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resize_toplevel)
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
      if use_markup
        (_names.to_unsafe + _n).value = "use-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_markup)
        _n += 1
      end
      if use_underline
        (_names.to_unsafe + _n).value = "use-underline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_underline)
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

      @pointer = LibGObject.g_object_new_with_properties(Expander.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_expander_get_type
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

    def expanded=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "expanded", unsafe_value, Pointer(Void).null)
      value
    end

    def expanded? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "expanded", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def label=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "label", unsafe_value, Pointer(Void).null)
      value
    end

    def label : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "label", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def label_widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "label-widget", unsafe_value, Pointer(Void).null)
      value
    end

    def label_widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "label-widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def resize_toplevel=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "resize-toplevel", unsafe_value, Pointer(Void).null)
      value
    end

    def resize_toplevel? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "resize-toplevel", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def use_markup=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-markup", unsafe_value, Pointer(Void).null)
      value
    end

    def use_markup? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-markup", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def use_underline=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-underline", unsafe_value, Pointer(Void).null)
      value
    end

    def use_underline? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-underline", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize(label : ::String?)
      # gtk_expander_new: (Constructor)
      # @label: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_expander_new(label)

      # Return value handling
      @pointer = _retval
      LibGObject.g_object_ref(_retval)
    end

    def self.new_with_mnemonic(label : ::String?) : self
      # gtk_expander_new_with_mnemonic: (Constructor)
      # @label: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_expander_new_with_mnemonic(label)

      # Return value handling
      Gtk::Expander.new(_retval, GICrystal::Transfer::Full)
    end

    def child : Gtk::Widget?
      # gtk_expander_get_child: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_expander_get_child(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def expanded : Bool
      # gtk_expander_get_expanded: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_expander_get_expanded(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def label : ::String?
      # gtk_expander_get_label: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_expander_get_label(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def label_widget : Gtk::Widget?
      # gtk_expander_get_label_widget: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_expander_get_label_widget(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def resize_toplevel : Bool
      # gtk_expander_get_resize_toplevel: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_expander_get_resize_toplevel(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def use_markup : Bool
      # gtk_expander_get_use_markup: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_expander_get_use_markup(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def use_underline : Bool
      # gtk_expander_get_use_underline: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_expander_get_use_underline(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def child=(child : Gtk::Widget?) : Nil
      # gtk_expander_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_expander_set_child(self, child)

      # Return value handling
    end

    def expanded=(expanded : Bool) : Nil
      # gtk_expander_set_expanded: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_expander_set_expanded(self, expanded)

      # Return value handling
    end

    def label=(label : ::String?) : Nil
      # gtk_expander_set_label: (Method | Setter)
      # @label: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      LibGtk.gtk_expander_set_label(self, label)

      # Return value handling
    end

    def label_widget=(label_widget : Gtk::Widget?) : Nil
      # gtk_expander_set_label_widget: (Method | Setter)
      # @label_widget: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      label_widget = if label_widget.nil?
                       Pointer(Void).null
                     else
                       label_widget.to_unsafe
                     end

      # C call
      LibGtk.gtk_expander_set_label_widget(self, label_widget)

      # Return value handling
    end

    def resize_toplevel=(resize_toplevel : Bool) : Nil
      # gtk_expander_set_resize_toplevel: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_expander_set_resize_toplevel(self, resize_toplevel)

      # Return value handling
    end

    def use_markup=(use_markup : Bool) : Nil
      # gtk_expander_set_use_markup: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_expander_set_use_markup(self, use_markup)

      # Return value handling
    end

    def use_underline=(use_underline : Bool) : Nil
      # gtk_expander_set_use_underline: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_expander_set_use_underline(self, use_underline)

      # Return value handling
    end

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

      def connect(block : Proc(Gtk::Expander, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Expander.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Expander, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Expander, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Expander.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Expander, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate")
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end
  end
end
