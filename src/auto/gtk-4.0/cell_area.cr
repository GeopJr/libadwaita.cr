require "../g_object-2.0/initially_unowned"
require "./buildable"

require "./cell_layout"

module Gtk
  # An abstract class for laying out `GtkCellRenderer`s
  #
  # The `GtkCellArea` is an abstract class for [class@Gtk.CellLayout]
  # widgets (also referred to as "layouting widgets") to interface with
  # an arbitrary number of [class@Gtk.CellRenderer]s and interact with the user
  # for a given [iface@Gtk.TreeModel] row.
  #
  # The cell area handles events, focus navigation, drawing and
  # size requests and allocations for a given row of data.
  #
  # Usually users dont have to interact with the `GtkCellArea` directly
  # unless they are implementing a cell-layouting widget themselves.
  #
  # # Requesting area sizes
  #
  # As outlined in
  # [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management),
  # GTK uses a height-for-width
  # geometry management system to compute the sizes of widgets and user
  # interfaces. `GtkCellArea` uses the same semantics to calculate the
  # size of an area for an arbitrary number of `GtkTreeModel` rows.
  #
  # When requesting the size of a cell area one needs to calculate
  # the size for a handful of rows, and this will be done differently by
  # different layouting widgets. For instance a [class@Gtk.TreeViewColumn]
  # always lines up the areas from top to bottom while a [class@Gtk.IconView]
  # on the other hand might enforce that all areas received the same
  # width and wrap the areas around, requesting height for more cell
  # areas when allocated less width.
  #
  # It’s also important for areas to maintain some cell
  # alignments with areas rendered for adjacent rows (cells can
  # appear “columnized” inside an area even when the size of
  # cells are different in each row). For this reason the `GtkCellArea`
  # uses a [class@Gtk.CellAreaContext] object to store the alignments
  # and sizes along the way (as well as the overall largest minimum
  # and natural size for all the rows which have been calculated
  # with the said context).
  #
  # The [class@Gtk.CellAreaContext] is an opaque object specific to the
  # `GtkCellArea` which created it (see [method@Gtk.CellArea.create_context]).
  #
  # The owning cell-layouting widget can create as many contexts as
  # it wishes to calculate sizes of rows which should receive the
  # same size in at least one orientation (horizontally or vertically),
  # However, it’s important that the same [class@Gtk.CellAreaContext] which
  # was used to request the sizes for a given `GtkTreeModel` row be
  # used when rendering or processing events for that row.
  #
  # In order to request the width of all the rows at the root level
  # of a `GtkTreeModel` one would do the following:
  #
  # ```c
  # GtkTreeIter iter;
  # int minimum_width;
  # int natural_width;
  #
  # valid = gtk_tree_model_get_iter_first (model, &iter);
  # while (valid)
  #   {
  #     gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);
  #     gtk_cell_area_get_preferred_width (area, context, widget, NULL, NULL);
  #
  #     valid = gtk_tree_model_iter_next (model, &iter);
  #   }
  #
  # gtk_cell_area_context_get_preferred_width (context, &minimum_width, &natural_width);
  # ```
  #
  # Note that in this example it’s not important to observe the
  # returned minimum and natural width of the area for each row
  # unless the cell-layouting object is actually interested in the
  # widths of individual rows. The overall width is however stored
  # in the accompanying `GtkCellAreaContext` object and can be consulted
  # at any time.
  #
  # This can be useful since `GtkCellLayout` widgets usually have to
  # support requesting and rendering rows in treemodels with an
  # exceedingly large amount of rows. The `GtkCellLayout` widget in
  # that case would calculate the required width of the rows in an
  # idle or timeout source (see [func@GLib.timeout_add]) and when the widget
  # is requested its actual width in [vfunc@Gtk.Widget.measure]
  # it can simply consult the width accumulated so far in the
  # `GtkCellAreaContext` object.
  #
  # A simple example where rows are rendered from top to bottom and
  # take up the full width of the layouting widget would look like:
  #
  # ```c
  # static void
  # foo_get_preferred_width (GtkWidget *widget,
  #                          int       *minimum_size,
  #                          int       *natural_size)
  # {
  #   Foo *self = FOO (widget);
  #   FooPrivate *priv = foo_get_instance_private (self);
  #
  #   foo_ensure_at_least_one_handfull_of_rows_have_been_requested (self);
  #
  #   gtk_cell_area_context_get_preferred_width (priv->context, minimum_size, natural_size);
  # }
  # ```
  #
  # In the above example the `Foo` widget has to make sure that some
  # row sizes have been calculated (the amount of rows that `Foo` judged
  # was appropriate to request space for in a single timeout iteration)
  # before simply returning the amount of space required by the area via
  # the `GtkCellAreaContext`.
  #
  # Requesting the height for width (or width for height) of an area is
  # a similar task except in this case the `GtkCellAreaContext` does not
  # store the data (actually, it does not know how much space the layouting
  # widget plans to allocate it for every row. It’s up to the layouting
  # widget to render each row of data with the appropriate height and
  # width which was requested by the `GtkCellArea`).
  #
  # In order to request the height for width of all the rows at the
  # root level of a `GtkTreeModel` one would do the following:
  #
  # ```c
  # GtkTreeIter iter;
  # int minimum_height;
  # int natural_height;
  # int full_minimum_height = 0;
  # int full_natural_height = 0;
  #
  # valid = gtk_tree_model_get_iter_first (model, &iter);
  # while (valid)
  #   {
  #     gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);
  #     gtk_cell_area_get_preferred_height_for_width (area, context, widget,
  #                                                   width, &minimum_height, &natural_height);
  #
  #     if (width_is_for_allocation)
  #        cache_row_height (&iter, minimum_height, natural_height);
  #
  #     full_minimum_height += minimum_height;
  #     full_natural_height += natural_height;
  #
  #     valid = gtk_tree_model_iter_next (model, &iter);
  #   }
  # ```
  #
  # Note that in the above example we would need to cache the heights
  # returned for each row so that we would know what sizes to render the
  # areas for each row. However we would only want to really cache the
  # heights if the request is intended for the layouting widgets real
  # allocation.
  #
  # In some cases the layouting widget is requested the height for an
  # arbitrary for_width, this is a special case for layouting widgets
  # who need to request size for tens of thousands  of rows. For this
  # case it’s only important that the layouting widget calculate
  # one reasonably sized chunk of rows and return that height
  # synchronously. The reasoning here is that any layouting widget is
  # at least capable of synchronously calculating enough height to fill
  # the screen height (or scrolled window height) in response to a single
  # call to [vfunc@Gtk.Widget.measure]. Returning
  # a perfect height for width that is larger than the screen area is
  # inconsequential since after the layouting receives an allocation
  # from a scrolled window it simply continues to drive the scrollbar
  # values while more and more height is required for the row heights
  # that are calculated in the background.
  #
  # # Rendering Areas
  #
  # Once area sizes have been acquired at least for the rows in the
  # visible area of the layouting widget they can be rendered at
  # [vfunc@Gtk.Widget.snapshot] time.
  #
  # A crude example of how to render all the rows at the root level
  # runs as follows:
  #
  # ```c
  # GtkAllocation allocation;
  # GdkRectangle cell_area = { 0, };
  # GtkTreeIter iter;
  # int minimum_width;
  # int natural_width;
  #
  # gtk_widget_get_allocation (widget, &allocation);
  # cell_area.width = allocation.width;
  #
  # valid = gtk_tree_model_get_iter_first (model, &iter);
  # while (valid)
  #   {
  #     cell_area.height = get_cached_height_for_row (&iter);
  #
  #     gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);
  #     gtk_cell_area_render (area, context, widget, cr,
  #                           &cell_area, &cell_area, state_flags, FALSE);
  #
  #     cell_area.y += cell_area.height;
  #
  #     valid = gtk_tree_model_iter_next (model, &iter);
  #   }
  # ```
  #
  # Note that the cached height in this example really depends on how
  # the layouting widget works. The layouting widget might decide to
  # give every row its minimum or natural height or, if the model content
  # is expected to fit inside the layouting widget without scrolling, it
  # would make sense to calculate the allocation for each row at
  # the time the widget is allocated using [func@Gtk.distribute_natural_allocation].
  #
  # # Handling Events and Driving Keyboard Focus
  #
  # Passing events to the area is as simple as handling events on any
  # normal widget and then passing them to the [method@Gtk.CellArea.event]
  # API as they come in. Usually `GtkCellArea` is only interested in
  # button events, however some customized derived areas can be implemented
  # who are interested in handling other events. Handling an event can
  # trigger the [`signal@Gtk.CellArea::focus-changed`] signal to fire; as well
  # as [`signal@GtkCellArea::add-editable`] in the case that an editable cell
  # was clicked and needs to start editing. You can call
  # [method@Gtk.CellArea.stop_editing] at any time to cancel any cell editing
  # that is currently in progress.
  #
  # The `GtkCellArea` drives keyboard focus from cell to cell in a way
  # similar to `GtkWidget`. For layouting widgets that support giving
  # focus to cells it’s important to remember to pass `GTK_CELL_RENDERER_FOCUSED`
  # to the area functions for the row that has focus and to tell the
  # area to paint the focus at render time.
  #
  # Layouting widgets that accept focus on cells should implement the
  # [vfunc@Gtk.Widget.focus] virtual method. The layouting widget is always
  # responsible for knowing where `GtkTreeModel` rows are rendered inside
  # the widget, so at [vfunc@Gtk.Widget.focus] time the layouting widget
  # should use the `GtkCellArea` methods to navigate focus inside the area
  # and then observe the [enum@Gtk.DirectionType] to pass the focus to adjacent
  # rows and areas.
  #
  # A basic example of how the [vfunc@Gtk.Widget.focus] virtual method
  # should be implemented:
  #
  # ```
  # static gboolean
  # foo_focus (GtkWidget       *widget,
  #            GtkDirectionType direction)
  # {
  #   Foo *self = FOO (widget);
  #   FooPrivate *priv = foo_get_instance_private (self);
  #   int focus_row = priv->focus_row;
  #   gboolean have_focus = FALSE;
  #
  #   if (!gtk_widget_has_focus (widget))
  #     gtk_widget_grab_focus (widget);
  #
  #   valid = gtk_tree_model_iter_nth_child (priv->model, &iter, NULL, priv->focus_row);
  #   while (valid)
  #     {
  #       gtk_cell_area_apply_attributes (priv->area, priv->model, &iter, FALSE, FALSE);
  #
  #       if (gtk_cell_area_focus (priv->area, direction))
  #         {
  #            priv->focus_row = focus_row;
  #            have_focus = TRUE;
  #            break;
  #         }
  #       else
  #         {
  #           if (direction == GTK_DIR_RIGHT ||
  #               direction == GTK_DIR_LEFT)
  #             break;
  #           else if (direction == GTK_DIR_UP ||
  #                    direction == GTK_DIR_TAB_BACKWARD)
  #            {
  #               if (focus_row == 0)
  #                 break;
  #               else
  #                {
  #                   focus_row--;
  #                   valid = gtk_tree_model_iter_nth_child (priv->model, &iter, NULL, focus_row);
  #                }
  #             }
  #           else
  #             {
  #               if (focus_row == last_row)
  #                 break;
  #               else
  #                 {
  #                   focus_row++;
  #                   valid = gtk_tree_model_iter_next (priv->model, &iter);
  #                 }
  #             }
  #         }
  #     }
  #     return have_focus;
  # }
  # ```
  #
  # Note that the layouting widget is responsible for matching the
  # `GtkDirectionType` values to the way it lays out its cells.
  #
  # # Cell Properties
  #
  # The `GtkCellArea` introduces cell properties for `GtkCellRenderer`s.
  # This provides some general interfaces for defining the relationship
  # cell areas have with their cells. For instance in a [class@Gtk.CellAreaBox]
  # a cell might “expand” and receive extra space when the area is allocated
  # more than its full natural request, or a cell might be configured to “align”
  # with adjacent rows which were requested and rendered with the same
  # `GtkCellAreaContext`.
  #
  # Use [method@Gtk.CellAreaClass.install_cell_property] to install cell
  # properties for a cell area class and [method@Gtk.CellAreaClass.find_cell_property]
  # or [method@Gtk.CellAreaClass.list_cell_properties] to get information about
  # existing cell properties.
  #
  # To set the value of a cell property, use [method@Gtk.CellArea.cell_set_property],
  # [method@Gtk.CellArea.cell_set] or [method@Gtk.CellArea.cell_set_valist]. To obtain
  # the value of a cell property, use [method@Gtk.CellArea.cell_get_property]
  # [method@Gtk.CellArea.cell_get] or [method@Gtk.CellArea.cell_get_valist].
  class CellArea < GObject::InitiallyUnowned
    include Buildable
    include CellLayout

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, edit_widget : Gtk::CellEditable? = nil, edited_cell : Gtk::CellRenderer? = nil, focus_cell : Gtk::CellRenderer? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if edit_widget
        (_names.to_unsafe + _n).value = "edit-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, edit_widget)
        _n += 1
      end
      if edited_cell
        (_names.to_unsafe + _n).value = "edited-cell".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, edited_cell)
        _n += 1
      end
      if focus_cell
        (_names.to_unsafe + _n).value = "focus-cell".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_cell)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CellArea.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_area_get_type
    end

    def edit_widget : Gtk::CellEditable?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "edit-widget", pointerof(value), Pointer(Void).null)
      Gtk::CellEditable__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def edited_cell : Gtk::CellRenderer?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "edited-cell", pointerof(value), Pointer(Void).null)
      Gtk::CellRenderer.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def focus_cell=(value : Gtk::CellRenderer?) : Gtk::CellRenderer?
      unsafe_value = value

      LibGObject.g_object_set(self, "focus-cell", unsafe_value, Pointer(Void).null)
      value
    end

    def focus_cell : Gtk::CellRenderer?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "focus-cell", pointerof(value), Pointer(Void).null)
      Gtk::CellRenderer.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def activate(context : Gtk::CellAreaContext, widget : Gtk::Widget, cell_area : Gdk::Rectangle, flags : Gtk::CellRendererState, edit_only : Bool) : Bool
      # gtk_cell_area_activate: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_activate(self, context, widget, cell_area, flags, edit_only)
      GICrystal.to_bool(_retval)
    end

    def activate_cell(widget : Gtk::Widget, renderer : Gtk::CellRenderer, event : Gdk::Event, cell_area : Gdk::Rectangle, flags : Gtk::CellRendererState) : Bool
      # gtk_cell_area_activate_cell: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_activate_cell(self, widget, renderer, event, cell_area, flags)
      GICrystal.to_bool(_retval)
    end

    def add(renderer : Gtk::CellRenderer) : Nil
      # gtk_cell_area_add: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_add(self, renderer)
    end

    def add_focus_sibling(renderer : Gtk::CellRenderer, sibling : Gtk::CellRenderer) : Nil
      # gtk_cell_area_add_focus_sibling: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_add_focus_sibling(self, renderer, sibling)
    end

    def apply_attributes(tree_model : Gtk::TreeModel, iter : Gtk::TreeIter, is_expander : Bool, is_expanded : Bool) : Nil
      # gtk_cell_area_apply_attributes: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_apply_attributes(self, tree_model, iter, is_expander, is_expanded)
    end

    def attribute_connect(renderer : Gtk::CellRenderer, attribute : ::String, column : Int32) : Nil
      # gtk_cell_area_attribute_connect: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_attribute_connect(self, renderer, attribute, column)
    end

    def attribute_disconnect(renderer : Gtk::CellRenderer, attribute : ::String) : Nil
      # gtk_cell_area_attribute_disconnect: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_attribute_disconnect(self, renderer, attribute)
    end

    def attribute_get_column(renderer : Gtk::CellRenderer, attribute : ::String) : Int32
      # gtk_cell_area_attribute_get_column: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_attribute_get_column(self, renderer, attribute)
      _retval
    end

    def cell_get_property(renderer : Gtk::CellRenderer, property_name : ::String, value : _) : Nil
      # gtk_cell_area_cell_get_property: (Method)
      # Returns: (transfer none)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      LibGtk.gtk_cell_area_cell_get_property(self, renderer, property_name, value)
    end

    def cell_set_property(renderer : Gtk::CellRenderer, property_name : ::String, value : _) : Nil
      # gtk_cell_area_cell_set_property: (Method)
      # Returns: (transfer none)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      LibGtk.gtk_cell_area_cell_set_property(self, renderer, property_name, value)
    end

    def copy_context(context : Gtk::CellAreaContext) : Gtk::CellAreaContext
      # gtk_cell_area_copy_context: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_cell_area_copy_context(self, context)
      Gtk::CellAreaContext.new(_retval, GICrystal::Transfer::Full)
    end

    def create_context : Gtk::CellAreaContext
      # gtk_cell_area_create_context: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_cell_area_create_context(self)
      Gtk::CellAreaContext.new(_retval, GICrystal::Transfer::Full)
    end

    def event(context : Gtk::CellAreaContext, widget : Gtk::Widget, event : Gdk::Event, cell_area : Gdk::Rectangle, flags : Gtk::CellRendererState) : Int32
      # gtk_cell_area_event: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_event(self, context, widget, event, cell_area, flags)
      _retval
    end

    def focus(direction : Gtk::DirectionType) : Bool
      # gtk_cell_area_focus: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_focus(self, direction)
      GICrystal.to_bool(_retval)
    end

    def foreach(callback : Pointer(Void), callback_data : Pointer(Nil)?) : Nil
      # gtk_cell_area_foreach: (Method)
      # @callback_data: (nullable)
      # Returns: (transfer none)

      callback_data = if callback_data.nil?
                        Pointer(Void).null
                      else
                        callback_data.to_unsafe
                      end

      LibGtk.gtk_cell_area_foreach(self, callback, callback_data)
    end

    def foreach_alloc(context : Gtk::CellAreaContext, widget : Gtk::Widget, cell_area : Gdk::Rectangle, background_area : Gdk::Rectangle, callback : Pointer(Void), callback_data : Pointer(Nil)?) : Nil
      # gtk_cell_area_foreach_alloc: (Method)
      # @callback_data: (nullable)
      # Returns: (transfer none)

      callback_data = if callback_data.nil?
                        Pointer(Void).null
                      else
                        callback_data.to_unsafe
                      end

      LibGtk.gtk_cell_area_foreach_alloc(self, context, widget, cell_area, background_area, callback, callback_data)
    end

    def cell_allocation(context : Gtk::CellAreaContext, widget : Gtk::Widget, renderer : Gtk::CellRenderer, cell_area : Gdk::Rectangle) : Gdk::Rectangle
      # gtk_cell_area_get_cell_allocation: (Method)
      # @allocation: (out) (caller-allocates)
      # Returns: (transfer none)

      allocation = Gdk::Rectangle.new

      LibGtk.gtk_cell_area_get_cell_allocation(self, context, widget, renderer, cell_area, allocation)
      allocation
    end

    def cell_at_position(context : Gtk::CellAreaContext, widget : Gtk::Widget, cell_area : Gdk::Rectangle, x : Int32, y : Int32) : Gdk::Rectangle
      # gtk_cell_area_get_cell_at_position: (Method)
      # @alloc_area: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      alloc_area = Pointer(Void).null
      alloc_area = Gdk::Rectangle.new

      _retval = LibGtk.gtk_cell_area_get_cell_at_position(self, context, widget, cell_area, x, y, alloc_area)
      alloc_area
    end

    def current_path_string : ::String
      # gtk_cell_area_get_current_path_string: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_get_current_path_string(self)
      ::String.new(_retval)
    end

    def edit_widget : Gtk::CellEditable
      # gtk_cell_area_get_edit_widget: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_get_edit_widget(self)
      Gtk::CellEditable__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def edited_cell : Gtk::CellRenderer
      # gtk_cell_area_get_edited_cell: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_get_edited_cell(self)
      Gtk::CellRenderer.new(_retval, GICrystal::Transfer::None)
    end

    def focus_cell : Gtk::CellRenderer
      # gtk_cell_area_get_focus_cell: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_get_focus_cell(self)
      Gtk::CellRenderer.new(_retval, GICrystal::Transfer::None)
    end

    def focus_from_sibling(renderer : Gtk::CellRenderer) : Gtk::CellRenderer?
      # gtk_cell_area_get_focus_from_sibling: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_get_focus_from_sibling(self, renderer)
      Gtk::CellRenderer.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def focus_siblings(renderer : Gtk::CellRenderer) : GLib::List
      # gtk_cell_area_get_focus_siblings: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_get_focus_siblings(self, renderer)
      GLib::List(Gtk::CellRenderer).new(_retval, GICrystal::Transfer::None)
    end

    def preferred_height(context : Gtk::CellAreaContext, widget : Gtk::Widget) : Nil
      # gtk_cell_area_get_preferred_height: (Method)
      # @minimum_height: (out) (transfer full) (optional)
      # @natural_height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      minimum_height = Pointer(Int32).null
      natural_height = Pointer(Int32).null

      LibGtk.gtk_cell_area_get_preferred_height(self, context, widget, minimum_height, natural_height)
    end

    def preferred_height_for_width(context : Gtk::CellAreaContext, widget : Gtk::Widget, width : Int32) : Nil
      # gtk_cell_area_get_preferred_height_for_width: (Method)
      # @minimum_height: (out) (transfer full) (optional)
      # @natural_height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      minimum_height = Pointer(Int32).null
      natural_height = Pointer(Int32).null

      LibGtk.gtk_cell_area_get_preferred_height_for_width(self, context, widget, width, minimum_height, natural_height)
    end

    def preferred_width(context : Gtk::CellAreaContext, widget : Gtk::Widget) : Nil
      # gtk_cell_area_get_preferred_width: (Method)
      # @minimum_width: (out) (transfer full) (optional)
      # @natural_width: (out) (transfer full) (optional)
      # Returns: (transfer none)

      minimum_width = Pointer(Int32).null
      natural_width = Pointer(Int32).null

      LibGtk.gtk_cell_area_get_preferred_width(self, context, widget, minimum_width, natural_width)
    end

    def preferred_width_for_height(context : Gtk::CellAreaContext, widget : Gtk::Widget, height : Int32) : Nil
      # gtk_cell_area_get_preferred_width_for_height: (Method)
      # @minimum_width: (out) (transfer full) (optional)
      # @natural_width: (out) (transfer full) (optional)
      # Returns: (transfer none)

      minimum_width = Pointer(Int32).null
      natural_width = Pointer(Int32).null

      LibGtk.gtk_cell_area_get_preferred_width_for_height(self, context, widget, height, minimum_width, natural_width)
    end

    def request_mode : Gtk::SizeRequestMode
      # gtk_cell_area_get_request_mode: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_get_request_mode(self)
      Gtk::SizeRequestMode.from_value(_retval)
    end

    def has_renderer(renderer : Gtk::CellRenderer) : Bool
      # gtk_cell_area_has_renderer: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_has_renderer(self, renderer)
      GICrystal.to_bool(_retval)
    end

    def inner_cell_area(widget : Gtk::Widget, cell_area : Gdk::Rectangle) : Gdk::Rectangle
      # gtk_cell_area_inner_cell_area: (Method)
      # @inner_area: (out) (caller-allocates)
      # Returns: (transfer none)

      inner_area = Gdk::Rectangle.new

      LibGtk.gtk_cell_area_inner_cell_area(self, widget, cell_area, inner_area)
      inner_area
    end

    def is_activatable : Bool
      # gtk_cell_area_is_activatable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_is_activatable(self)
      GICrystal.to_bool(_retval)
    end

    def is_focus_sibling(renderer : Gtk::CellRenderer, sibling : Gtk::CellRenderer) : Bool
      # gtk_cell_area_is_focus_sibling: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_is_focus_sibling(self, renderer, sibling)
      GICrystal.to_bool(_retval)
    end

    def remove(renderer : Gtk::CellRenderer) : Nil
      # gtk_cell_area_remove: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_remove(self, renderer)
    end

    def remove_focus_sibling(renderer : Gtk::CellRenderer, sibling : Gtk::CellRenderer) : Nil
      # gtk_cell_area_remove_focus_sibling: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_remove_focus_sibling(self, renderer, sibling)
    end

    def request_renderer(renderer : Gtk::CellRenderer, orientation : Gtk::Orientation, widget : Gtk::Widget, for_size : Int32) : Nil
      # gtk_cell_area_request_renderer: (Method)
      # @minimum_size: (out) (transfer full) (optional)
      # @natural_size: (out) (transfer full) (optional)
      # Returns: (transfer none)

      minimum_size = Pointer(Int32).null
      natural_size = Pointer(Int32).null

      LibGtk.gtk_cell_area_request_renderer(self, renderer, orientation, widget, for_size, minimum_size, natural_size)
    end

    def focus_cell=(renderer : Gtk::CellRenderer) : Nil
      # gtk_cell_area_set_focus_cell: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_set_focus_cell(self, renderer)
    end

    def snapshot(context : Gtk::CellAreaContext, widget : Gtk::Widget, snapshot : Gtk::Snapshot, background_area : Gdk::Rectangle, cell_area : Gdk::Rectangle, flags : Gtk::CellRendererState, paint_focus : Bool) : Nil
      # gtk_cell_area_snapshot: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_snapshot(self, context, widget, snapshot, background_area, cell_area, flags, paint_focus)
    end

    def stop_editing(canceled : Bool) : Nil
      # gtk_cell_area_stop_editing: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_stop_editing(self, canceled)
    end

    struct AddEditableSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "add-editable::#{@detail}" : "add-editable"
      end

      def connect(&block : Proc(Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), lib_arg3 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = Gtk::CellRenderer.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::CellEditable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gdk::Rectangle.new(lib_arg2, GICrystal::Transfer::None)
          arg3 = ::String.new(lib_arg3)
          ::Box(Proc(Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), lib_arg3 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = Gtk::CellRenderer.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::CellEditable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gdk::Rectangle.new(lib_arg2, GICrystal::Transfer::None)
          arg3 = ::String.new(lib_arg3)
          ::Box(Proc(Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), lib_arg3 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::CellArea.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::CellRenderer.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::CellEditable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gdk::Rectangle.new(lib_arg2, GICrystal::Transfer::None)
          arg3 = ::String.new(lib_arg3)
          ::Box(Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), lib_arg3 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::CellArea.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::CellRenderer.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::CellEditable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gdk::Rectangle.new(lib_arg2, GICrystal::Transfer::None)
          arg3 = ::String.new(lib_arg3)
          ::Box(Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(renderer : Gtk::CellRenderer, editable : Gtk::CellEditable, cell_area : Gdk::Rectangle, path : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "add-editable", renderer, editable, cell_area, path)
      end
    end

    def add_editable_signal
      AddEditableSignal.new(self)
    end

    struct ApplyAttributesSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "apply-attributes::#{@detail}" : "apply-attributes"
      end

      def connect(&block : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::TreeModel__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::TreeModel__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::CellArea, Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::CellArea.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeModel__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::CellArea, Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellArea, Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::CellArea.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeModel__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::CellArea, Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(model : Gtk::TreeModel, iter : Gtk::TreeIter, is_expander : Bool, is_expanded : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "apply-attributes", model, iter, is_expander, is_expanded)
      end
    end

    def apply_attributes_signal
      ApplyAttributesSignal.new(self)
    end

    struct FocusChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "focus-changed::#{@detail}" : "focus-changed"
      end

      def connect(&block : Proc(Gtk::CellRenderer, ::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::CellRenderer, ::String, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::CellRenderer, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = Gtk::CellRenderer.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = ::String.new(lib_arg1)
          ::Box(Proc(Gtk::CellRenderer, ::String, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellRenderer, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = Gtk::CellRenderer.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = ::String.new(lib_arg1)
          ::Box(Proc(Gtk::CellRenderer, ::String, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::CellArea, Gtk::CellRenderer, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::CellArea.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::CellRenderer.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = ::String.new(lib_arg1)
          ::Box(Proc(Gtk::CellArea, Gtk::CellRenderer, ::String, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellArea, Gtk::CellRenderer, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::CellArea.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::CellRenderer.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = ::String.new(lib_arg1)
          ::Box(Proc(Gtk::CellArea, Gtk::CellRenderer, ::String, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(renderer : Gtk::CellRenderer, path : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "focus-changed", renderer, path)
      end
    end

    def focus_changed_signal
      FocusChangedSignal.new(self)
    end

    struct RemoveEditableSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "remove-editable::#{@detail}" : "remove-editable"
      end

      def connect(&block : Proc(Gtk::CellRenderer, Gtk::CellEditable, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::CellRenderer, Gtk::CellEditable, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::CellRenderer, Gtk::CellEditable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::CellRenderer.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::CellEditable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CellRenderer, Gtk::CellEditable, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellRenderer, Gtk::CellEditable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::CellRenderer.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::CellEditable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CellRenderer, Gtk::CellEditable, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CellArea.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::CellRenderer.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::CellEditable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CellArea.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::CellRenderer.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::CellEditable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(renderer : Gtk::CellRenderer, editable : Gtk::CellEditable) : Nil
        LibGObject.g_signal_emit_by_name(@source, "remove-editable", renderer, editable)
      end
    end

    def remove_editable_signal
      RemoveEditableSignal.new(self)
    end
  end
end
