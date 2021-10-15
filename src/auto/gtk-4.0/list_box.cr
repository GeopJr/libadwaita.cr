require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkListBox` is a vertical list.
  #
  # A `GtkListBox` only contains `GtkListBoxRow` children. These rows can
  # by dynamically sorted and filtered, and headers can be added dynamically
  # depending on the row content. It also allows keyboard and mouse navigation
  # and selection like a typical list.
  #
  # Using `GtkListBox` is often an alternative to `GtkTreeView`, especially
  # when the list contents has a more complicated layout than what is allowed
  # by a `GtkCellRenderer`, or when the contents is interactive (i.e. has a
  # button in it).
  #
  # Although a `GtkListBox` must have only `GtkListBoxRow` children, you can
  # add any kind of widget to it via [method@Gtk.ListBox.prepend],
  # [method@Gtk.ListBox.append] and [method@Gtk.ListBox.insert] and a
  # `GtkListBoxRow` widget will automatically be inserted between the list
  # and the widget.
  #
  # `GtkListBoxRows` can be marked as activatable or selectable. If a row is
  # activatable, [signal@Gtk.ListBox::row-activated] will be emitted for it when
  # the user tries to activate it. If it is selectable, the row will be marked
  # as selected when the user tries to select it.
  #
  # # GtkListBox as GtkBuildable
  #
  # The `GtkListBox` implementation of the `GtkBuildable` interface supports
  # setting a child as the placeholder by specifying “placeholder” as the “type”
  # attribute of a <child> element. See [method@Gtk.ListBox.set_placeholder]
  # for info.
  #
  # # CSS nodes
  #
  # |[<!-- language="plain" -->
  # list[.separators][.rich-list][.navigation-sidebar]
  # ╰── row[.activatable]
  # ]|
  #
  # `GtkListBox` uses a single CSS node named list. It may carry the .separators
  # style class, when the [property@Gtk.ListBox:show-separators] property is set.
  # Each `GtkListBoxRow` uses a single CSS node named row. The row nodes get the
  # .activatable style class added when appropriate.
  #
  # The main list node may also carry style classes to select
  # the style of [list presentation](section-list-widget.html#list-styles):
  # .rich-list, .navigation-sidebar or .data-table.
  #
  # # Accessibility
  #
  # `GtkListBox` uses the %GTK_ACCESSIBLE_ROLE_LIST role and `GtkListBoxRow` uses
  # the %GTK_ACCESSIBLE_ROLE_LIST_ITEM role.
  class ListBox < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accept_unpaired_release : Bool? = nil, accessible_role : Gtk::AccessibleRole? = nil, activate_on_single_click : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, selection_mode : Gtk::SelectionMode? = nil, sensitive : Bool? = nil, show_separators : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[39]
      _values = StaticArray(LibGObject::Value, 39).new(LibGObject::Value.new)
      _n = 0

      if accept_unpaired_release
        (_names.to_unsafe + _n).value = "accept-unpaired-release".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accept_unpaired_release)
        _n += 1
      end
      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if activate_on_single_click
        (_names.to_unsafe + _n).value = "activate-on-single-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activate_on_single_click)
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
      if selection_mode
        (_names.to_unsafe + _n).value = "selection-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selection_mode)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if show_separators
        (_names.to_unsafe + _n).value = "show-separators".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_separators)
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

      @pointer = LibGObject.g_object_new_with_properties(ListBox.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_list_box_get_type
    end

    def initialize
      # gtk_list_box_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_box_new
      @pointer = _retval
    end

    def append(child : Gtk::Widget) : Nil
      # gtk_list_box_append: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_append(self, child)
    end

    def bind_model(model : Gio::ListModel?, create_widget_func : Pointer(Void)?, user_data : Pointer(Nil)?, user_data_free_func : Pointer(Void)) : Nil
      # gtk_list_box_bind_model: (Method)
      # @model: (nullable)
      # @create_widget_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      create_widget_func = if create_widget_func.nil?
                             LibGtk::ListBoxCreateWidgetFunc.null
                           else
                             create_widget_func.to_unsafe
                           end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGtk.gtk_list_box_bind_model(self, model, create_widget_func, user_data, user_data_free_func)
    end

    def drag_highlight_row(row : Gtk::ListBoxRow) : Nil
      # gtk_list_box_drag_highlight_row: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_drag_highlight_row(self, row)
    end

    def drag_unhighlight_row : Nil
      # gtk_list_box_drag_unhighlight_row: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_drag_unhighlight_row(self)
    end

    def activate_on_single_click? : Bool
      # gtk_list_box_get_activate_on_single_click: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_box_get_activate_on_single_click(self)
      GICrystal.to_bool(_retval)
    end

    def adjustment : Gtk::Adjustment
      # gtk_list_box_get_adjustment: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_box_get_adjustment(self)
      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None)
    end

    def row_at_index(index_ : Int32) : Gtk::ListBoxRow?
      # gtk_list_box_get_row_at_index: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_box_get_row_at_index(self, index_)
      Gtk::ListBoxRow.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def row_at_y(y : Int32) : Gtk::ListBoxRow?
      # gtk_list_box_get_row_at_y: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_box_get_row_at_y(self, y)
      Gtk::ListBoxRow.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def selected_row : Gtk::ListBoxRow?
      # gtk_list_box_get_selected_row: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_box_get_selected_row(self)
      Gtk::ListBoxRow.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def selected_rows : GLib::List
      # gtk_list_box_get_selected_rows: (Method)
      # Returns: (transfer container)

      _retval = LibGtk.gtk_list_box_get_selected_rows(self)
      GLib::List(Gtk::ListBoxRow).new(_retval, GICrystal::Transfer::Container)
    end

    def selection_mode : Gtk::SelectionMode
      # gtk_list_box_get_selection_mode: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_box_get_selection_mode(self)
      Gtk::SelectionMode.from_value(_retval)
    end

    def show_separators? : Bool
      # gtk_list_box_get_show_separators: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_box_get_show_separators(self)
      GICrystal.to_bool(_retval)
    end

    def insert(child : Gtk::Widget, position : Int32) : Nil
      # gtk_list_box_insert: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_insert(self, child, position)
    end

    def invalidate_filter : Nil
      # gtk_list_box_invalidate_filter: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_invalidate_filter(self)
    end

    def invalidate_headers : Nil
      # gtk_list_box_invalidate_headers: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_invalidate_headers(self)
    end

    def invalidate_sort : Nil
      # gtk_list_box_invalidate_sort: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_invalidate_sort(self)
    end

    def prepend(child : Gtk::Widget) : Nil
      # gtk_list_box_prepend: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_prepend(self, child)
    end

    def remove(child : Gtk::Widget) : Nil
      # gtk_list_box_remove: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_remove(self, child)
    end

    def select_all : Nil
      # gtk_list_box_select_all: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_select_all(self)
    end

    def select_row(row : Gtk::ListBoxRow?) : Nil
      # gtk_list_box_select_row: (Method)
      # @row: (nullable)
      # Returns: (transfer none)

      row = if row.nil?
              Pointer(Void).null
            else
              row.to_unsafe
            end

      LibGtk.gtk_list_box_select_row(self, row)
    end

    def selected_foreach(func : Pointer(Void), data : Pointer(Nil)?) : Nil
      # gtk_list_box_selected_foreach: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      LibGtk.gtk_list_box_selected_foreach(self, func, data)
    end

    def activate_on_single_click=(single : Bool) : Nil
      # gtk_list_box_set_activate_on_single_click: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_set_activate_on_single_click(self, single)
    end

    def adjustment=(adjustment : Gtk::Adjustment?) : Nil
      # gtk_list_box_set_adjustment: (Method)
      # @adjustment: (nullable)
      # Returns: (transfer none)

      adjustment = if adjustment.nil?
                     Pointer(Void).null
                   else
                     adjustment.to_unsafe
                   end

      LibGtk.gtk_list_box_set_adjustment(self, adjustment)
    end

    def set_filter_func(filter_func : Pointer(Void)?, user_data : Pointer(Nil)?, destroy : Pointer(Void)) : Nil
      # gtk_list_box_set_filter_func: (Method)
      # @filter_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      filter_func = if filter_func.nil?
                      LibGtk::ListBoxFilterFunc.null
                    else
                      filter_func.to_unsafe
                    end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGtk.gtk_list_box_set_filter_func(self, filter_func, user_data, destroy)
    end

    def set_header_func(update_header : Pointer(Void)?, user_data : Pointer(Nil)?, destroy : Pointer(Void)) : Nil
      # gtk_list_box_set_header_func: (Method)
      # @update_header: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      update_header = if update_header.nil?
                        LibGtk::ListBoxUpdateHeaderFunc.null
                      else
                        update_header.to_unsafe
                      end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGtk.gtk_list_box_set_header_func(self, update_header, user_data, destroy)
    end

    def placeholder=(placeholder : Gtk::Widget?) : Nil
      # gtk_list_box_set_placeholder: (Method)
      # @placeholder: (nullable)
      # Returns: (transfer none)

      placeholder = if placeholder.nil?
                      Pointer(Void).null
                    else
                      placeholder.to_unsafe
                    end

      LibGtk.gtk_list_box_set_placeholder(self, placeholder)
    end

    def selection_mode=(mode : Gtk::SelectionMode) : Nil
      # gtk_list_box_set_selection_mode: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_set_selection_mode(self, mode)
    end

    def show_separators=(show_separators : Bool) : Nil
      # gtk_list_box_set_show_separators: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_set_show_separators(self, show_separators)
    end

    def set_sort_func(sort_func : Pointer(Void)?, user_data : Pointer(Nil)?, destroy : Pointer(Void)) : Nil
      # gtk_list_box_set_sort_func: (Method)
      # @sort_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      sort_func = if sort_func.nil?
                    LibGtk::ListBoxSortFunc.null
                  else
                    sort_func.to_unsafe
                  end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGtk.gtk_list_box_set_sort_func(self, sort_func, user_data, destroy)
    end

    def unselect_all : Nil
      # gtk_list_box_unselect_all: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_unselect_all(self)
    end

    def unselect_row(row : Gtk::ListBoxRow) : Nil
      # gtk_list_box_unselect_row: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_box_unselect_row(self, row)
    end

    struct ActivateCursorRowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate-cursor-row::#{@detail}" : "activate-cursor-row"
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

      def connect(block : Proc(Gtk::ListBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-cursor-row")
      end
    end

    def activate_cursor_row_signal
      ActivateCursorRowSignal.new(self)
    end

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

      def connect(&block : Proc(Gtk::MovementStep, Int32, Bool, Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::MovementStep, Int32, Bool, Bool, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::MovementStep, Int32, Bool, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Bool, Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::MovementStep, Int32, Bool, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Bool, Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ListBox, Gtk::MovementStep, Int32, Bool, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::ListBox, Gtk::MovementStep, Int32, Bool, Bool, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListBox, Gtk::MovementStep, Int32, Bool, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::ListBox, Gtk::MovementStep, Int32, Bool, Bool, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Gtk::MovementStep, p0 : Int32, p1 : Bool, p2 : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-cursor", object, p0, p1, p2)
      end
    end

    def move_cursor_signal
      MoveCursorSignal.new(self)
    end

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

      def connect(&block : Proc(Gtk::ListBoxRow, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ListBoxRow, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::ListBoxRow, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::ListBoxRow.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBoxRow, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListBoxRow, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::ListBoxRow.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBoxRow, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ListBoxRow.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ListBoxRow.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(row : Gtk::ListBoxRow) : Nil
        LibGObject.g_signal_emit_by_name(@source, "row-activated", row)
      end
    end

    def row_activated_signal
      RowActivatedSignal.new(self)
    end

    struct RowSelectedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "row-selected::#{@detail}" : "row-selected"
      end

      def connect(&block : Proc(Gtk::ListBoxRow, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ListBoxRow, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::ListBoxRow, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::ListBoxRow.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBoxRow, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListBoxRow, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::ListBoxRow.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBoxRow, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ListBoxRow.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ListBoxRow.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(row : Gtk::ListBoxRow) : Nil
        LibGObject.g_signal_emit_by_name(@source, "row-selected", row)
      end
    end

    def row_selected_signal
      RowSelectedSignal.new(self)
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

      def connect(block : Proc(Gtk::ListBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-all")
      end
    end

    def select_all_signal
      SelectAllSignal.new(self)
    end

    struct SelectedRowsChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "selected-rows-changed::#{@detail}" : "selected-rows-changed"
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

      def connect(block : Proc(Gtk::ListBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "selected-rows-changed")
      end
    end

    def selected_rows_changed_signal
      SelectedRowsChangedSignal.new(self)
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

      def connect(block : Proc(Gtk::ListBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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

      def connect(block : Proc(Gtk::ListBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::ListBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
