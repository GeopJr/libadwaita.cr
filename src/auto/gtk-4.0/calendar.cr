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
  # A `GtkCalendar` can be created with `Gtk::Calendar.new`.
  #
  # The date that is currently displayed can be altered with
  # `Gtk::Calendar#select_day`.
  #
  # To place a visual marker on a particular day, use
  # `Gtk::Calendar#mark_day` and to remove the marker,
  # `Gtk::Calendar#unmark_day`. Alternative, all
  # marks can be cleared with `Gtk::Calendar#clear_marks`.
  #
  # The selected date can be retrieved from a `GtkCalendar` using
  # `Gtk::Calendar#date`.
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
  @[GObject::GeneratedWrapper]
  class Calendar < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::Calendar), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, day : Int32? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, month : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_day_names : Bool? = nil, show_heading : Bool? = nil, show_week_numbers : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil, year : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[41]
      _values = StaticArray(LibGObject::Value, 41).new(LibGObject::Value.new)
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
      if !day.nil?
        (_names.to_unsafe + _n).value = "day".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, day)
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
      if !month.nil?
        (_names.to_unsafe + _n).value = "month".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, month)
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
      if !show_day_names.nil?
        (_names.to_unsafe + _n).value = "show-day-names".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_day_names)
        _n += 1
      end
      if !show_heading.nil?
        (_names.to_unsafe + _n).value = "show-heading".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_heading)
        _n += 1
      end
      if !show_week_numbers.nil?
        (_names.to_unsafe + _n).value = "show-week-numbers".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_week_numbers)
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
      if !year.nil?
        (_names.to_unsafe + _n).value = "year".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, year)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Calendar.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    # Creates a new calendar, with the current date being selected.
    def initialize
      # gtk_calendar_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_calendar_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
    end

    # Remove all visual markers.
    def clear_marks : Nil
      # gtk_calendar_clear_marks: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_calendar_clear_marks(self)

      # Return value handling
    end

    # Returns a `GDateTime` representing the shown
    # year, month and the selected day.
    #
    # The returned date is in the local time zone.
    def date : GLib::DateTime
      # gtk_calendar_get_date: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_calendar_get_date(self)

      # Return value handling

      GLib::DateTime.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns if the @day of the @calendar is already marked.
    def day_is_marked(day : UInt32) : Bool
      # gtk_calendar_get_day_is_marked: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_calendar_get_day_is_marked(self, day)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether @self is currently showing the names
    # of the week days.
    #
    # This is the value of the [property@Gtk.Calendar:show-day-names]
    # property.
    def show_day_names : Bool
      # gtk_calendar_get_show_day_names: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_calendar_get_show_day_names(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether @self is currently showing the heading.
    #
    # This is the value of the [property@Gtk.Calendar:show-heading]
    # property.
    def show_heading : Bool
      # gtk_calendar_get_show_heading: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_calendar_get_show_heading(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether @self is showing week numbers right
    # now.
    #
    # This is the value of the [property@Gtk.Calendar:show-week-numbers]
    # property.
    def show_week_numbers : Bool
      # gtk_calendar_get_show_week_numbers: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_calendar_get_show_week_numbers(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Places a visual marker on a particular day.
    def mark_day(day : UInt32) : Nil
      # gtk_calendar_mark_day: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_calendar_mark_day(self, day)

      # Return value handling
    end

    # Switches to @date's year and month and select its day.
    def select_day(date : GLib::DateTime) : Nil
      # gtk_calendar_select_day: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_calendar_select_day(self, date)

      # Return value handling
    end

    # Sets whether the calendar shows day names.
    def show_day_names=(value : Bool) : Nil
      # gtk_calendar_set_show_day_names: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_calendar_set_show_day_names(self, value)

      # Return value handling
    end

    # Sets whether the calendar should show a heading.
    #
    # The heading contains the current year and month as well as
    # buttons for changing both.
    def show_heading=(value : Bool) : Nil
      # gtk_calendar_set_show_heading: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_calendar_set_show_heading(self, value)

      # Return value handling
    end

    # Sets whether week numbers are shown in the calendar.
    def show_week_numbers=(value : Bool) : Nil
      # gtk_calendar_set_show_week_numbers: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_calendar_set_show_week_numbers(self, value)

      # Return value handling
    end

    # Removes the visual marker from a particular day.
    def unmark_day(day : UInt32) : Nil
      # gtk_calendar_unmark_day: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_calendar_unmark_day(self, day)

      # Return value handling
    end

    # Emitted when the user selects a day.
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

    # Emitted when the user switched to the next month.
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

    # Emitted when user switched to the next year.
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

    # Emitted when the user switched to the previous month.
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

    # Emitted when user switched to the previous year.
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
