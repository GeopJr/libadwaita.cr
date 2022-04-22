require "../gtk-4.0/widget"
require "./swipeable"

require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

require "../gtk-4.0/orientable"

module Adw
  # A paginated scrolling widget.
  #
  # <picture>
  #   <source srcset="carousel-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="carousel.png" alt="carousel">
  # </picture>
  #
  # The `AdwCarousel` widget can be used to display a set of pages with
  # swipe-based navigation between them.
  #
  # `#CarouselIndicatorDots` and `#CarouselIndicatorLines` can be used
  # to provide page indicators for `AdwCarousel`.
  #
  # ## CSS nodes
  #
  # `AdwCarousel` has a single CSS node with name `carousel`.
  @[GObject::GeneratedWrapper]
  class Carousel < Gtk::Widget
    include Swipeable
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget
    include Gtk::Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::CarouselClass), class_init,
        sizeof(LibAdw::Carousel), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, allow_long_swipes : Bool? = nil, allow_mouse_drag : Bool? = nil, allow_scroll_wheel : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, interactive : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, n_pages : UInt32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, position : Float64? = nil, receives_default : Bool? = nil, reveal_duration : UInt32? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, scroll_params : Adw::SpringParams? = nil, sensitive : Bool? = nil, spacing : UInt32? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[45]
      _values = StaticArray(LibGObject::Value, 45).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !allow_long_swipes.nil?
        (_names.to_unsafe + _n).value = "allow-long-swipes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_long_swipes)
        _n += 1
      end
      if !allow_mouse_drag.nil?
        (_names.to_unsafe + _n).value = "allow-mouse-drag".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_mouse_drag)
        _n += 1
      end
      if !allow_scroll_wheel.nil?
        (_names.to_unsafe + _n).value = "allow-scroll-wheel".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_scroll_wheel)
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
      if !interactive.nil?
        (_names.to_unsafe + _n).value = "interactive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, interactive)
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
      if !n_pages.nil?
        (_names.to_unsafe + _n).value = "n-pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_pages)
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
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !reveal_duration.nil?
        (_names.to_unsafe + _n).value = "reveal-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reveal_duration)
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
      if !scroll_params.nil?
        (_names.to_unsafe + _n).value = "scroll-params".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scroll_params)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !spacing.nil?
        (_names.to_unsafe + _n).value = "spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, spacing)
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

      @pointer = LibGObject.g_object_new_with_properties(Carousel.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    def scroll_params=(value : Adw::SpringParams?) : Adw::SpringParams?
      unsafe_value = value

      LibGObject.g_object_set(self, "scroll-params", unsafe_value, Pointer(Void).null)
      value
    end

    def scroll_params : Adw::SpringParams?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "scroll-params", pointerof(value), Pointer(Void).null)
      Adw::SpringParams.new(value, GICrystal::Transfer::None) unless value.null?
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

    # Creates a new `AdwCarousel`.
    def initialize
      # adw_carousel_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_carousel_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
    end

    # Appends @child to @self.
    def append(child : Gtk::Widget) : Nil
      # adw_carousel_append: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_append(self, child)

      # Return value handling
    end

    # Gets whether to allow swiping for more than one page at a time.
    def allow_long_swipes : Bool
      # adw_carousel_get_allow_long_swipes: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_carousel_get_allow_long_swipes(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets whether @self can be dragged with mouse pointer.
    def allow_mouse_drag : Bool
      # adw_carousel_get_allow_mouse_drag: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_carousel_get_allow_mouse_drag(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self will respond to scroll wheel events.
    def allow_scroll_wheel : Bool
      # adw_carousel_get_allow_scroll_wheel: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_carousel_get_allow_scroll_wheel(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self can be navigated.
    def interactive : Bool
      # adw_carousel_get_interactive: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_carousel_get_interactive(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the number of pages in @self.
    def n_pages : UInt32
      # adw_carousel_get_n_pages: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_carousel_get_n_pages(self)

      # Return value handling

      _retval
    end

    # Gets the page at position @n.
    def nth_page(n : UInt32) : Gtk::Widget
      # adw_carousel_get_nth_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_carousel_get_nth_page(self, n)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    # Gets current scroll position in @self.
    #
    # It's unitless, 1 matches 1 page.
    def position : Float64
      # adw_carousel_get_position: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_carousel_get_position(self)

      # Return value handling

      _retval
    end

    # Gets duration of the animation used when adding or removing pages.
    def reveal_duration : UInt32
      # adw_carousel_get_reveal_duration: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_carousel_get_reveal_duration(self)

      # Return value handling

      _retval
    end

    # Gets the scroll animation spring parameters for @self.
    def scroll_params : Adw::SpringParams
      # adw_carousel_get_scroll_params: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_carousel_get_scroll_params(self)

      # Return value handling

      Adw::SpringParams.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets spacing between pages in pixels.
    def spacing : UInt32
      # adw_carousel_get_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_carousel_get_spacing(self)

      # Return value handling

      _retval
    end

    # Inserts @child into @self at position @position.
    #
    # If position is -1, or larger than the number of pages,
    # @child will be appended to the end.
    def insert(child : Gtk::Widget, position : Int32) : Nil
      # adw_carousel_insert: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_insert(self, child, position)

      # Return value handling
    end

    # Prepends @child to @self.
    def prepend(child : Gtk::Widget) : Nil
      # adw_carousel_prepend: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_prepend(self, child)

      # Return value handling
    end

    # Removes @child from @self.
    def remove(child : Gtk::Widget) : Nil
      # adw_carousel_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_remove(self, child)

      # Return value handling
    end

    # Moves @child into position @position.
    #
    # If position is -1, or larger than the number of pages, @child will be moved
    # at the end.
    def reorder(child : Gtk::Widget, position : Int32) : Nil
      # adw_carousel_reorder: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_reorder(self, child, position)

      # Return value handling
    end

    # Scrolls to @widget.
    #
    # If @animate is `TRUE`, the transition will be animated.
    def scroll_to(widget : Gtk::Widget, animate : Bool) : Nil
      # adw_carousel_scroll_to: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_scroll_to(self, widget, animate)

      # Return value handling
    end

    # Sets whether to allow swiping for more than one page at a time.
    def allow_long_swipes=(allow_long_swipes : Bool) : Nil
      # adw_carousel_set_allow_long_swipes: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_set_allow_long_swipes(self, allow_long_swipes)

      # Return value handling
    end

    # Sets whether @self can be dragged with mouse pointer.
    def allow_mouse_drag=(allow_mouse_drag : Bool) : Nil
      # adw_carousel_set_allow_mouse_drag: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_set_allow_mouse_drag(self, allow_mouse_drag)

      # Return value handling
    end

    # Sets whether @self will respond to scroll wheel events.
    def allow_scroll_wheel=(allow_scroll_wheel : Bool) : Nil
      # adw_carousel_set_allow_scroll_wheel: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_set_allow_scroll_wheel(self, allow_scroll_wheel)

      # Return value handling
    end

    # Sets whether @self can be navigated.
    def interactive=(interactive : Bool) : Nil
      # adw_carousel_set_interactive: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_set_interactive(self, interactive)

      # Return value handling
    end

    # Sets duration of the animation used when adding or removing pages.
    def reveal_duration=(reveal_duration : UInt32) : Nil
      # adw_carousel_set_reveal_duration: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_set_reveal_duration(self, reveal_duration)

      # Return value handling
    end

    # Sets the scroll animation spring parameters for @self.
    def scroll_params=(params : Adw::SpringParams) : Nil
      # adw_carousel_set_scroll_params: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_set_scroll_params(self, params)

      # Return value handling
    end

    # Sets spacing between pages in pixels.
    def spacing=(spacing : UInt32) : Nil
      # adw_carousel_set_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_carousel_set_spacing(self, spacing)

      # Return value handling
    end

    # This signal is emitted after a page has been changed.
    #
    # It can be used to implement "infinite scrolling" by amending the pages
    # after every scroll.
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
