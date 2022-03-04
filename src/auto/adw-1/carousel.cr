require "../gtk-4.0/widget"
require "./swipeable"

require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

require "../gtk-4.0/orientable"

module Adw
  # A paginated scrolling widget.
  #
  # The `AdwCarousel` widget can be used to display a set of pages with
  # swipe-based navigation between them.
  #
  # [class@Adw.CarouselIndicatorDots] and [class@Adw.CarouselIndicatorLines] can
  # be used to provide page indicators for `AdwCarousel`.
  #
  # ## CSS nodes
  #
  # `AdwCarousel` has a single CSS node with name `carousel`.
  class Carousel < Gtk::Widget
    include Swipeable
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget
    include Gtk::Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, allow_long_swipes : Bool? = nil, allow_mouse_drag : Bool? = nil, allow_scroll_wheel : Bool? = nil, animation_duration : UInt32? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, interactive : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, n_pages : UInt32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, position : Float64? = nil, receives_default : Bool? = nil, reveal_duration : UInt32? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, spacing : UInt32? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[45]
      _values = StaticArray(LibGObject::Value, 45).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if allow_long_swipes
        (_names.to_unsafe + _n).value = "allow-long-swipes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_long_swipes)
        _n += 1
      end
      if allow_mouse_drag
        (_names.to_unsafe + _n).value = "allow-mouse-drag".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_mouse_drag)
        _n += 1
      end
      if allow_scroll_wheel
        (_names.to_unsafe + _n).value = "allow-scroll-wheel".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_scroll_wheel)
        _n += 1
      end
      if animation_duration
        (_names.to_unsafe + _n).value = "animation-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, animation_duration)
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
      if interactive
        (_names.to_unsafe + _n).value = "interactive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, interactive)
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
      if n_pages
        (_names.to_unsafe + _n).value = "n-pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_pages)
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
      if reveal_duration
        (_names.to_unsafe + _n).value = "reveal-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reveal_duration)
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

      @pointer = LibGObject.g_object_new_with_properties(Carousel.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_carousel_get_type
    end

    def allow_long_swipes=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "allow-long-swipes", unsafe_value, Pointer(Void).null)
      value
    end

    def allow_long_swipes? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "allow-long-swipes", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def allow_mouse_drag=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "allow-mouse-drag", unsafe_value, Pointer(Void).null)
      value
    end

    def allow_mouse_drag? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "allow-mouse-drag", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def allow_scroll_wheel=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "allow-scroll-wheel", unsafe_value, Pointer(Void).null)
      value
    end

    def allow_scroll_wheel? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "allow-scroll-wheel", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def animation_duration=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "animation-duration", unsafe_value, Pointer(Void).null)
      value
    end

    def animation_duration : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "animation-duration", pointerof(value), Pointer(Void).null)
      value
    end

    def interactive=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "interactive", unsafe_value, Pointer(Void).null)
      value
    end

    def interactive? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "interactive", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def n_pages : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "n-pages", pointerof(value), Pointer(Void).null)
      value
    end

    def position : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "position", pointerof(value), Pointer(Void).null)
      value
    end

    def reveal_duration=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "reveal-duration", unsafe_value, Pointer(Void).null)
      value
    end

    def reveal_duration : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "reveal-duration", pointerof(value), Pointer(Void).null)
      value
    end

    def spacing=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "spacing", unsafe_value, Pointer(Void).null)
      value
    end

    def spacing : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "spacing", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize
      # adw_carousel_new: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_carousel_new

      # Return value handling
      @pointer = _retval
      LibGObject.g_object_ref(_retval)
    end

    def append(child : Gtk::Widget) : Nil
      # adw_carousel_append: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_append(self, child)

      # Return value handling
    end

    def allow_long_swipes : Bool
      # adw_carousel_get_allow_long_swipes: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_carousel_get_allow_long_swipes(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def allow_mouse_drag : Bool
      # adw_carousel_get_allow_mouse_drag: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_carousel_get_allow_mouse_drag(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def allow_scroll_wheel : Bool
      # adw_carousel_get_allow_scroll_wheel: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_carousel_get_allow_scroll_wheel(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def animation_duration : UInt32
      # adw_carousel_get_animation_duration: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_carousel_get_animation_duration(self)

      # Return value handling
      _retval
    end

    def interactive : Bool
      # adw_carousel_get_interactive: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_carousel_get_interactive(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def n_pages : UInt32
      # adw_carousel_get_n_pages: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_carousel_get_n_pages(self)

      # Return value handling
      _retval
    end

    def nth_page(n : UInt32) : Gtk::Widget
      # adw_carousel_get_nth_page: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_carousel_get_nth_page(self, n)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    def position : Float64
      # adw_carousel_get_position: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_carousel_get_position(self)

      # Return value handling
      _retval
    end

    def reveal_duration : UInt32
      # adw_carousel_get_reveal_duration: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_carousel_get_reveal_duration(self)

      # Return value handling
      _retval
    end

    def spacing : UInt32
      # adw_carousel_get_spacing: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_carousel_get_spacing(self)

      # Return value handling
      _retval
    end

    def insert(child : Gtk::Widget, position : Int32) : Nil
      # adw_carousel_insert: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_insert(self, child, position)

      # Return value handling
    end

    def prepend(child : Gtk::Widget) : Nil
      # adw_carousel_prepend: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_prepend(self, child)

      # Return value handling
    end

    def remove(child : Gtk::Widget) : Nil
      # adw_carousel_remove: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_remove(self, child)

      # Return value handling
    end

    def reorder(child : Gtk::Widget, position : Int32) : Nil
      # adw_carousel_reorder: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_reorder(self, child, position)

      # Return value handling
    end

    def scroll_to(widget : Gtk::Widget) : Nil
      # adw_carousel_scroll_to: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_scroll_to(self, widget)

      # Return value handling
    end

    def scroll_to_full(widget : Gtk::Widget, duration : Int64) : Nil
      # adw_carousel_scroll_to_full: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_scroll_to_full(self, widget, duration)

      # Return value handling
    end

    def allow_long_swipes=(allow_long_swipes : Bool) : Nil
      # adw_carousel_set_allow_long_swipes: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_set_allow_long_swipes(self, allow_long_swipes)

      # Return value handling
    end

    def allow_mouse_drag=(allow_mouse_drag : Bool) : Nil
      # adw_carousel_set_allow_mouse_drag: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_set_allow_mouse_drag(self, allow_mouse_drag)

      # Return value handling
    end

    def allow_scroll_wheel=(allow_scroll_wheel : Bool) : Nil
      # adw_carousel_set_allow_scroll_wheel: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_set_allow_scroll_wheel(self, allow_scroll_wheel)

      # Return value handling
    end

    def animation_duration=(duration : UInt32) : Nil
      # adw_carousel_set_animation_duration: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_set_animation_duration(self, duration)

      # Return value handling
    end

    def interactive=(interactive : Bool) : Nil
      # adw_carousel_set_interactive: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_set_interactive(self, interactive)

      # Return value handling
    end

    def reveal_duration=(reveal_duration : UInt32) : Nil
      # adw_carousel_set_reveal_duration: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_set_reveal_duration(self, reveal_duration)

      # Return value handling
    end

    def spacing=(spacing : UInt32) : Nil
      # adw_carousel_set_spacing: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_carousel_set_spacing(self, spacing)

      # Return value handling
    end

    struct PageChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "page-changed::#{@detail}" : "page-changed"
      end

      def connect(&block : Proc(UInt32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(UInt32, Nil))
        connect(block)
      end

      def connect(block : Proc(UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(UInt32, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(UInt32, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Adw::Carousel, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Adw::Carousel.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Adw::Carousel, UInt32, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::Carousel, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Adw::Carousel.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Adw::Carousel, UInt32, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(index : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-changed", index)
      end
    end

    def page_changed_signal
      PageChangedSignal.new(self)
    end
  end
end
