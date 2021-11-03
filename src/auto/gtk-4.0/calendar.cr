require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkCalendar` is a widget that displays a Gregorian calendar, one month
  # at a time.
  #
  # ![An example GtkCalendar](calendar.png)
  #
  # A `GtkCalendar` can be created with [ctor@Gtk.Calendar.new].
  #
  # The date that is currently displayed can be altered with
  # [method@Gtk.Calendar.select_day].
  #
  # To place a visual marker on a particular day, use
  # [method@Gtk.Calendar.mark_day] and to remove the marker,
  # [method@Gtk.Calendar.unmark_day]. Alternative, all
  # marks can be cleared with [method@Gtk.Calendar.clear_marks].
  #
  # The selected date can be retrieved from a `GtkCalendar` using
  # [method@Gtk.Calendar.get_date].
  #
  # Users should be aware that, although the Gregorian calendar is the
  # legal calendar in most countries, it was adopted progressively
  # between 1582 and 1929. Display before these dates is likely to be
  # historically incorrect.
  #
  # # CSS nodes
  #
  # ```
  # calendar.view
  # ├── header
  # │   ├── button
  # │   ├── stack.month
  # │   ├── button
  # │   ├── button
  # │   ├── label.year
  # │   ╰── button
  # ╰── grid
  #     ╰── label[.day-name][.week-number][.day-number][.other-month][.today]
  # ```
  #
  # `GtkCalendar` has a main node with name calendar. It contains a subnode
  # called header containing the widgets for switching between years and months.
  #
  # The grid subnode contains all day labels, including week numbers on the left
  # (marked with the .week-number css class) and day names on top (marked with the
  # .day-name css class).
  #
  # Day labels that belong to the previous or next month get the .other-month
  # style class. The label of the current day get the .today style class.
  #
  # Marked day labels get the :selected state assigned.
  class Calendar < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, day : Int32? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, month : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_day_names : Bool? = nil, show_heading : Bool? = nil, show_week_numbers : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil, year : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[41]
      _values = StaticArray(LibGObject::Value, 41).new(LibGObject::Value.new)
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
      if day
        (_names.to_unsafe + _n).value = "day".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, day)
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
      if month
        (_names.to_unsafe + _n).value = "month".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, month)
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
      if show_day_names
        (_names.to_unsafe + _n).value = "show-day-names".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_day_names)
        _n += 1
      end
      if show_heading
        (_names.to_unsafe + _n).value = "show-heading".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_heading)
        _n += 1
      end
      if show_week_numbers
        (_names.to_unsafe + _n).value = "show-week-numbers".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_week_numbers)
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
      if year
        (_names.to_unsafe + _n).value = "year".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, year)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Calendar.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_calendar_get_type
    end

    def day=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "day", unsafe_value, Pointer(Void).null)
      value
    end

    def day : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "day", pointerof(value), Pointer(Void).null)
      value
    end

    def month=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "month", unsafe_value, Pointer(Void).null)
      value
    end

    def month : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "month", pointerof(value), Pointer(Void).null)
      value
    end

    def show_day_names=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-day-names", unsafe_value, Pointer(Void).null)
      value
    end

    def show_day_names? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-day-names", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def show_heading=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-heading", unsafe_value, Pointer(Void).null)
      value
    end

    def show_heading? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-heading", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def show_week_numbers=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-week-numbers", unsafe_value, Pointer(Void).null)
      value
    end

    def show_week_numbers? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-week-numbers", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def year=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "year", unsafe_value, Pointer(Void).null)
      value
    end

    def year : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "year", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize
      # gtk_calendar_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_calendar_new
      @pointer = _retval
    end

    def clear_marks : Nil
      # gtk_calendar_clear_marks: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_calendar_clear_marks(self)
    end

    def date : GLib::DateTime
      # gtk_calendar_get_date: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_calendar_get_date(self)
      GLib::DateTime.new(_retval, GICrystal::Transfer::Full)
    end

    def day_is_marked(day : UInt32) : Bool
      # gtk_calendar_get_day_is_marked: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_calendar_get_day_is_marked(self, day)
      GICrystal.to_bool(_retval)
    end

    def show_day_names : Bool
      # gtk_calendar_get_show_day_names: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_calendar_get_show_day_names(self)
      GICrystal.to_bool(_retval)
    end

    def show_heading : Bool
      # gtk_calendar_get_show_heading: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_calendar_get_show_heading(self)
      GICrystal.to_bool(_retval)
    end

    def show_week_numbers : Bool
      # gtk_calendar_get_show_week_numbers: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_calendar_get_show_week_numbers(self)
      GICrystal.to_bool(_retval)
    end

    def mark_day(day : UInt32) : Nil
      # gtk_calendar_mark_day: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_calendar_mark_day(self, day)
    end

    def select_day(date : GLib::DateTime) : Nil
      # gtk_calendar_select_day: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_calendar_select_day(self, date)
    end

    def show_day_names=(value : Bool) : Nil
      # gtk_calendar_set_show_day_names: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_calendar_set_show_day_names(self, value)
    end

    def show_heading=(value : Bool) : Nil
      # gtk_calendar_set_show_heading: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_calendar_set_show_heading(self, value)
    end

    def show_week_numbers=(value : Bool) : Nil
      # gtk_calendar_set_show_week_numbers: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_calendar_set_show_week_numbers(self, value)
    end

    def unmark_day(day : UInt32) : Nil
      # gtk_calendar_unmark_day: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_calendar_unmark_day(self, day)
    end

    struct DaySelectedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "day-selected::#{@detail}" : "day-selected"
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

      def connect(block : Proc(Gtk::Calendar, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Calendar.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Calendar, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Calendar, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Calendar.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Calendar, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "day-selected")
      end
    end

    def day_selected_signal
      DaySelectedSignal.new(self)
    end

    struct NextMonthSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "next-month::#{@detail}" : "next-month"
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

      def connect(block : Proc(Gtk::Calendar, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Calendar.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Calendar, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Calendar, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Calendar.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Calendar, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "next-month")
      end
    end

    def next_month_signal
      NextMonthSignal.new(self)
    end

    struct NextYearSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "next-year::#{@detail}" : "next-year"
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

      def connect(block : Proc(Gtk::Calendar, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Calendar.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Calendar, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Calendar, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Calendar.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Calendar, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "next-year")
      end
    end

    def next_year_signal
      NextYearSignal.new(self)
    end

    struct PrevMonthSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "prev-month::#{@detail}" : "prev-month"
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

      def connect(block : Proc(Gtk::Calendar, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Calendar.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Calendar, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Calendar, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Calendar.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Calendar, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "prev-month")
      end
    end

    def prev_month_signal
      PrevMonthSignal.new(self)
    end

    struct PrevYearSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "prev-year::#{@detail}" : "prev-year"
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

      def connect(block : Proc(Gtk::Calendar, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Calendar.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Calendar, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Calendar, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Calendar.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Calendar, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "prev-year")
      end
    end

    def prev_year_signal
      PrevYearSignal.new(self)
    end
  end
end
