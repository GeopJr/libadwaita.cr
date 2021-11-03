require "./list_base"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./orientable"

require "./scrollable"

module Gtk
  # `GtkListView` presents a large dynamic list of items.
  #
  # `GtkListView` uses its factory to generate one row widget for each visible
  # item and shows them in a linear display, either vertically or horizontally.
  #
  # The [property@Gtk.ListView:show-separators] property offers a simple way to
  # display separators between the rows.
  #
  # `GtkListView` allows the user to select items according to the selection
  # characteristics of the model. For models that allow multiple selected items,
  # it is possible to turn on _rubberband selection_, using
  # [property@Gtk.ListView:enable-rubberband].
  #
  # If you need multiple columns with headers, see [class@Gtk.ColumnView].
  #
  # To learn more about the list widget framework, see the
  # [overview](section-list-widget.html).
  #
  # An example of using `GtkListView`:
  # ```c
  # static void
  # setup_listitem_cb (GtkListItemFactory *factory,
  #                    GtkListItem        *list_item)
  # {
  #   GtkWidget *image;
  #
  #   image = gtk_image_new ();
  #   gtk_image_set_icon_size (GTK_IMAGE (image), GTK_ICON_SIZE_LARGE);
  #   gtk_list_item_set_child (list_item, image);
  # }
  #
  # static void
  # bind_listitem_cb (GtkListItemFactory *factory,
  #                   GtkListItem        *list_item)
  # {
  #   GtkWidget *image;
  #   GAppInfo *app_info;
  #
  #   image = gtk_list_item_get_child (list_item);
  #   app_info = gtk_list_item_get_item (list_item);
  #   gtk_image_set_from_gicon (GTK_IMAGE (image), g_app_info_get_icon (app_info));
  # }
  #
  # static void
  # activate_cb (GtkListView  *list,
  #              guint         position,
  #              gpointer      unused)
  # {
  #   GAppInfo *app_info;
  #
  #   app_info = g_list_model_get_item (G_LIST_MODEL (gtk_list_view_get_model (list)), position);
  #   g_app_info_launch (app_info, NULL, NULL, NULL);
  #   g_object_unref (app_info);
  # }
  #
  # ...
  #
  #   model = create_application_list ();
  #
  #   factory = gtk_signal_list_item_factory_new ();
  #   g_signal_connect (factory, "setup", G_CALLBACK (setup_listitem_cb), NULL);
  #   g_signal_connect (factory, "bind", G_CALLBACK (bind_listitem_cb), NULL);
  #
  #   list = gtk_list_view_new (GTK_SELECTION_MODEL (gtk_single_selection_new (model)), factory);
  #
  #   g_signal_connect (list, "activate", G_CALLBACK (activate_cb), NULL);
  #
  #   gtk_scrolled_window_set_child (GTK_SCROLLED_WINDOW (sw), list);
  # ```
  #
  # # CSS nodes
  #
  # ```
  # listview[.separators][.rich-list][.navigation-sidebar][.data-table]
  # ├── row[.activatable]
  # │
  # ├── row[.activatable]
  # │
  # ┊
  # ╰── [rubberband]
  # ```
  #
  # `GtkListView` uses a single CSS node named `listview`. It may carry the
  # `.separators` style class, when [property@Gtk.ListView:show-separators]
  # property is set. Each child widget uses a single CSS node named `row`.
  # If the [property@Gtk.ListItem:activatable] property is set, the
  # corresponding row will have the `.activatable` style class. For
  # rubberband selection, a node with name `rubberband` is used.
  #
  # The main listview node may also carry style classes to select
  # the style of [list presentation](ListContainers.html#list-styles):
  # .rich-list, .navigation-sidebar or .data-table.
  #
  # # Accessibility
  #
  # `GtkListView` uses the %GTK_ACCESSIBLE_ROLE_LIST role, and the list
  # items use the %GTK_ACCESSIBLE_ROLE_LIST_ITEM role.
  class ListView < ListBase
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable
    include Scrollable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, enable_rubberband : Bool? = nil, factory : Gtk::ListItemFactory? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hscroll_policy : Gtk::ScrollablePolicy? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, model : Gtk::SelectionModel? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_separators : Bool? = nil, single_click_activate : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, vscroll_policy : Gtk::ScrollablePolicy? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[45]
      _values = StaticArray(LibGObject::Value, 45).new(LibGObject::Value.new)
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
      if enable_rubberband
        (_names.to_unsafe + _n).value = "enable-rubberband".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_rubberband)
        _n += 1
      end
      if factory
        (_names.to_unsafe + _n).value = "factory".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, factory)
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
      if hadjustment
        (_names.to_unsafe + _n).value = "hadjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hadjustment)
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
      if hscroll_policy
        (_names.to_unsafe + _n).value = "hscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hscroll_policy)
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
      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
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
      if show_separators
        (_names.to_unsafe + _n).value = "show-separators".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_separators)
        _n += 1
      end
      if single_click_activate
        (_names.to_unsafe + _n).value = "single-click-activate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, single_click_activate)
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
      if vadjustment
        (_names.to_unsafe + _n).value = "vadjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vadjustment)
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
      if vscroll_policy
        (_names.to_unsafe + _n).value = "vscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vscroll_policy)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ListView.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_list_view_get_type
    end

    def enable_rubberband=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-rubberband", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_rubberband? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enable-rubberband", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def factory=(value : Gtk::ListItemFactory?) : Gtk::ListItemFactory?
      unsafe_value = value

      LibGObject.g_object_set(self, "factory", unsafe_value, Pointer(Void).null)
      value
    end

    def factory : Gtk::ListItemFactory?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "factory", pointerof(value), Pointer(Void).null)
      Gtk::ListItemFactory.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def model=(value : Gtk::SelectionModel?) : Gtk::SelectionModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def model : Gtk::SelectionModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "model", pointerof(value), Pointer(Void).null)
      Gtk::SelectionModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def show_separators=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-separators", unsafe_value, Pointer(Void).null)
      value
    end

    def show_separators? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-separators", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def single_click_activate=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "single-click-activate", unsafe_value, Pointer(Void).null)
      value
    end

    def single_click_activate? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "single-click-activate", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize(model : Gtk::SelectionModel?, factory : Gtk::ListItemFactory?)
      # gtk_list_view_new: (Constructor)
      # @model: (transfer full) (nullable)
      # @factory: (transfer full) (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end
      LibGObject.g_object_ref(model)
      LibGObject.g_object_ref(factory)

      _retval = LibGtk.gtk_list_view_new(model, factory)
      @pointer = _retval
    end

    def enable_rubberband : Bool
      # gtk_list_view_get_enable_rubberband: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_view_get_enable_rubberband(self)
      GICrystal.to_bool(_retval)
    end

    def factory : Gtk::ListItemFactory?
      # gtk_list_view_get_factory: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_view_get_factory(self)
      Gtk::ListItemFactory.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def model : Gtk::SelectionModel?
      # gtk_list_view_get_model: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_view_get_model(self)
      Gtk::SelectionModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def show_separators : Bool
      # gtk_list_view_get_show_separators: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_view_get_show_separators(self)
      GICrystal.to_bool(_retval)
    end

    def single_click_activate : Bool
      # gtk_list_view_get_single_click_activate: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_view_get_single_click_activate(self)
      GICrystal.to_bool(_retval)
    end

    def enable_rubberband=(enable_rubberband : Bool) : Nil
      # gtk_list_view_set_enable_rubberband: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_list_view_set_enable_rubberband(self, enable_rubberband)
    end

    def factory=(factory : Gtk::ListItemFactory?) : Nil
      # gtk_list_view_set_factory: (Method | Setter)
      # @factory: (nullable)
      # Returns: (transfer none)

      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end

      LibGtk.gtk_list_view_set_factory(self, factory)
    end

    def model=(model : Gtk::SelectionModel?) : Nil
      # gtk_list_view_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_list_view_set_model(self, model)
    end

    def show_separators=(show_separators : Bool) : Nil
      # gtk_list_view_set_show_separators: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_list_view_set_show_separators(self, show_separators)
    end

    def single_click_activate=(single_click_activate : Bool) : Nil
      # gtk_list_view_set_single_click_activate: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_list_view_set_single_click_activate(self, single_click_activate)
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

      def connect(block : Proc(Gtk::ListView, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::ListView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::ListView, UInt32, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListView, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::ListView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::ListView, UInt32, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(position : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate", position)
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end
  end
end
