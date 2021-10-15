require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./native"

require "./shortcut_manager"

module Gtk
  # `GtkPopover` is a bubble-like context popup.
  #
  # ![An example GtkPopover](popover.png)
  #
  # It is primarily meant to provide context-dependent information
  # or options. Popovers are attached to a parent widget. By default,
  # they point to the whole widget area, although this behavior can be
  # changed with [method@Gtk.Popover.set_pointing_to].
  #
  # The position of a popover relative to the widget it is attached to
  # can also be changed with [method@Gtk.Popover.set_position]
  #
  # By default, `GtkPopover` performs a grab, in order to ensure input
  # events get redirected to it while it is shown, and also so the popover
  # is dismissed in the expected situations (clicks outside the popover,
  # or the Escape key being pressed). If no such modal behavior is desired
  # on a popover, [method@Gtk.Popover.set_autohide] may be called on it to
  # tweak its behavior.
  #
  # ## GtkPopover as menu replacement
  #
  # `GtkPopover` is often used to replace menus. The best was to do this
  # is to use the [class@Gtk.PopoverMenu] subclass which supports being
  # populated from a `GMenuModel` with [ctor@Gtk.PopoverMenu.new_from_model].
  #
  # ```xml
  # <section>
  #   <attribute name="display-hint">horizontal-buttons</attribute>
  #   <item>
  #     <attribute name="label">Cut</attribute>
  #     <attribute name="action">app.cut</attribute>
  #     <attribute name="verb-icon">edit-cut-symbolic</attribute>
  #   </item>
  #   <item>
  #     <attribute name="label">Copy</attribute>
  #     <attribute name="action">app.copy</attribute>
  #     <attribute name="verb-icon">edit-copy-symbolic</attribute>
  #   </item>
  #   <item>
  #     <attribute name="label">Paste</attribute>
  #     <attribute name="action">app.paste</attribute>
  #     <attribute name="verb-icon">edit-paste-symbolic</attribute>
  #   </item>
  # </section>
  # ```
  #
  # # CSS nodes
  #
  # ```
  # popover[.menu]
  # ├── arrow
  # ╰── contents.background
  #     ╰── <child>
  # ```
  #
  # The contents child node always gets the .background style class
  # and the popover itself gets the .menu style class if the popover
  # is menu-like (i.e. `GtkPopoverMenu`).
  #
  # Particular uses of `GtkPopover`, such as touch selection popups or
  # magnifiers in `GtkEntry` or `GtkTextView` get style classes like
  # .touch-selection or .magnifier to differentiate from plain popovers.
  #
  # When styling a popover directly, the popover node should usually
  # not have any background. The visible part of the popover can have
  # a shadow. To specify it in CSS, set the box-shadow of the contents node.
  #
  # Note that, in order to accomplish appropriate arrow visuals, `GtkPopover`
  # uses custom drawing for the arrow node. This makes it possible for the
  # arrow to change its shape dynamically, but it also limits the possibilities
  # of styling it using CSS. In particular, the arrow gets drawn over the
  # content node's border and shadow, so they look like one shape, which
  # means that the border width of the content node and the arrow node should
  # be the same. The arrow also does not support any border shape other than
  # solid, no border-radius, only one border width (border-bottom-width is
  # used) and no box-shadow.
  class Popover < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Native
    include ShortcutManager

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, autohide : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, cascade_popdown : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, default_widget : Gtk::Widget? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_arrow : Bool? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, mnemonics_visible : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, pointing_to : Gdk::Rectangle? = nil, position : Gtk::PositionType? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[43]
      _values = StaticArray(LibGObject::Value, 43).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if autohide
        (_names.to_unsafe + _n).value = "autohide".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, autohide)
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
      if cascade_popdown
        (_names.to_unsafe + _n).value = "cascade-popdown".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cascade_popdown)
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
      if default_widget
        (_names.to_unsafe + _n).value = "default-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_widget)
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
      if has_arrow
        (_names.to_unsafe + _n).value = "has-arrow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_arrow)
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
      if mnemonics_visible
        (_names.to_unsafe + _n).value = "mnemonics-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonics_visible)
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
      if pointing_to
        (_names.to_unsafe + _n).value = "pointing-to".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pointing_to)
        _n += 1
      end
      if position
        (_names.to_unsafe + _n).value = "position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, position)
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

      @pointer = LibGObject.g_object_new_with_properties(Popover.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_popover_get_type
    end

    def initialize
      # gtk_popover_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_popover_new
      @pointer = _retval
    end

    def autohide? : Bool
      # gtk_popover_get_autohide: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_popover_get_autohide(self)
      GICrystal.to_bool(_retval)
    end

    def cascade_popdown? : Bool
      # gtk_popover_get_cascade_popdown: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_popover_get_cascade_popdown(self)
      GICrystal.to_bool(_retval)
    end

    def child : Gtk::Widget?
      # gtk_popover_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_popover_get_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def has_arrow? : Bool
      # gtk_popover_get_has_arrow: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_popover_get_has_arrow(self)
      GICrystal.to_bool(_retval)
    end

    def mnemonics_visible? : Bool
      # gtk_popover_get_mnemonics_visible: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_popover_get_mnemonics_visible(self)
      GICrystal.to_bool(_retval)
    end

    def offset(x_offset : Int32?, y_offset : Int32?) : Nil
      # gtk_popover_get_offset: (Method)
      # @x_offset: (out) (transfer full) (nullable)
      # @y_offset: (out) (transfer full) (nullable)
      # Returns: (transfer none)

      x_offset = if x_offset.nil?
                   Int32.null
                 else
                   x_offset.to_unsafe
                 end
      y_offset = if y_offset.nil?
                   Int32.null
                 else
                   y_offset.to_unsafe
                 end

      LibGtk.gtk_popover_get_offset(self, x_offset, y_offset)
    end

    def pointing_to : Gdk::Rectangle
      # gtk_popover_get_pointing_to: (Method)
      # @rect: (out) (caller-allocates)
      # Returns: (transfer none)

      rect = Gdk::Rectangle.new

      _retval = LibGtk.gtk_popover_get_pointing_to(self, rect)
      rect
    end

    def position : Gtk::PositionType
      # gtk_popover_get_position: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_popover_get_position(self)
      Gtk::PositionType.from_value(_retval)
    end

    def popdown : Nil
      # gtk_popover_popdown: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_popover_popdown(self)
    end

    def popup : Nil
      # gtk_popover_popup: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_popover_popup(self)
    end

    def present : Nil
      # gtk_popover_present: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_popover_present(self)
    end

    def autohide=(autohide : Bool) : Nil
      # gtk_popover_set_autohide: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_popover_set_autohide(self, autohide)
    end

    def cascade_popdown=(cascade_popdown : Bool) : Nil
      # gtk_popover_set_cascade_popdown: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_popover_set_cascade_popdown(self, cascade_popdown)
    end

    def child=(child : Gtk::Widget?) : Nil
      # gtk_popover_set_child: (Method)
      # @child: (nullable)
      # Returns: (transfer none)

      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      LibGtk.gtk_popover_set_child(self, child)
    end

    def default_widget=(widget : Gtk::Widget?) : Nil
      # gtk_popover_set_default_widget: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      LibGtk.gtk_popover_set_default_widget(self, widget)
    end

    def has_arrow=(has_arrow : Bool) : Nil
      # gtk_popover_set_has_arrow: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_popover_set_has_arrow(self, has_arrow)
    end

    def mnemonics_visible=(mnemonics_visible : Bool) : Nil
      # gtk_popover_set_mnemonics_visible: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_popover_set_mnemonics_visible(self, mnemonics_visible)
    end

    def set_offset(x_offset : Int32, y_offset : Int32) : Nil
      # gtk_popover_set_offset: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_popover_set_offset(self, x_offset, y_offset)
    end

    def pointing_to=(rect : Gdk::Rectangle) : Nil
      # gtk_popover_set_pointing_to: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_popover_set_pointing_to(self, rect)
    end

    def position=(position : Gtk::PositionType) : Nil
      # gtk_popover_set_position: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_popover_set_position(self, position)
    end

    struct ActivateDefaultSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate-default::#{@detail}" : "activate-default"
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

      def connect(block : Proc(Gtk::Popover, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Popover.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Popover, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Popover, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Popover.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Popover, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-default")
      end
    end

    def activate_default_signal
      ActivateDefaultSignal.new(self)
    end

    struct ClosedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "closed::#{@detail}" : "closed"
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

      def connect(block : Proc(Gtk::Popover, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Popover.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Popover, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Popover, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Popover.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Popover, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "closed")
      end
    end

    def closed_signal
      ClosedSignal.new(self)
    end
  end
end
