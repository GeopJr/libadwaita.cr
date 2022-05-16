require "../g_object-2.0/initially_unowned"
require "./buildable"

require "./cell_layout"

module Gtk
  # An abstract class for laying out `GtkCellRenderer`s
  #
  # The `GtkCellArea` is an abstract class for `Gtk#CellLayout`
  # widgets (also referred to as "layouting widgets") to interface with
  # an arbitrary number of `Gtk#CellRenderer`s and interact with the user
  # for a given `Gtk#TreeModel` row.
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
  # different layouting widgets. For instance a `Gtk#TreeViewColumn`
  # always lines up the areas from top to bottom while a `Gtk#IconView`
  # on the other hand might enforce that all areas received the same
  # width and wrap the areas around, requesting height for more cell
  # areas when allocated less width.
  #
  # It’s also important for areas to maintain some cell
  # alignments with areas rendered for adjacent rows (cells can
  # appear “columnized” inside an area even when the size of
  # cells are different in each row). For this reason the `GtkCellArea`
  # uses a `Gtk#CellAreaContext` object to store the alignments
  # and sizes along the way (as well as the overall largest minimum
  # and natural size for all the rows which have been calculated
  # with the said context).
  #
  # The `Gtk#CellAreaContext` is an opaque object specific to the
  # `GtkCellArea` which created it (see `Gtk::CellArea#create_context`).
  #
  # The owning cell-layouting widget can create as many contexts as
  # it wishes to calculate sizes of rows which should receive the
  # same size in at least one orientation (horizontally or vertically),
  # However, it’s important that the same `Gtk#CellAreaContext` which
  # was used to request the sizes for a given `GtkTreeModel` row be
  # used when rendering or processing events for that row.
  #
  # In order to request the width of all the rows at the root level
  # of a `GtkTreeModel` one would do the following:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  # idle or timeout source (see `GLib#timeout_add`) and when the widget
  # is requested its actual width in `Gtk::Widget#measure`
  # it can simply consult the width accumulated so far in the
  # `GtkCellAreaContext` object.
  #
  # A simple example where rows are rendered from top to bottom and
  # take up the full width of the layouting widget would look like:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  # call to `Gtk::Widget#measure`. Returning
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
  # `Gtk::Widget#snapshot` time.
  #
  # A crude example of how to render all the rows at the root level
  # runs as follows:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  # the time the widget is allocated using `Gtk#distribute_natural_allocation`.
  #
  # # Handling Events and Driving Keyboard Focus
  #
  # Passing events to the area is as simple as handling events on any
  # normal widget and then passing them to the `Gtk::CellArea#event`
  # API as they come in. Usually `GtkCellArea` is only interested in
  # button events, however some customized derived areas can be implemented
  # who are interested in handling other events. Handling an event can
  # trigger the [`signal@Gtk.CellArea::focus-changed`] signal to fire; as well
  # as [`signal@GtkCellArea::add-editable`] in the case that an editable cell
  # was clicked and needs to start editing. You can call
  # `Gtk::CellArea#stop_editing` at any time to cancel any cell editing
  # that is currently in progress.
  #
  # The `GtkCellArea` drives keyboard focus from cell to cell in a way
  # similar to `GtkWidget`. For layouting widgets that support giving
  # focus to cells it’s important to remember to pass `GTK_CELL_RENDERER_FOCUSED`
  # to the area functions for the row that has focus and to tell the
  # area to paint the focus at render time.
  #
  # Layouting widgets that accept focus on cells should implement the
  # `Gtk::Widget#focus` virtual method. The layouting widget is always
  # responsible for knowing where `GtkTreeModel` rows are rendered inside
  # the widget, so at `Gtk::Widget#focus` time the layouting widget
  # should use the `GtkCellArea` methods to navigate focus inside the area
  # and then observe the `Gtk#DirectionType` to pass the focus to adjacent
  # rows and areas.
  #
  # A basic example of how the `Gtk::Widget#focus` virtual method
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
  # cell areas have with their cells. For instance in a `Gtk#CellAreaBox`
  # a cell might “expand” and receive extra space when the area is allocated
  # more than its full natural request, or a cell might be configured to “align”
  # with adjacent rows which were requested and rendered with the same
  # `GtkCellAreaContext`.
  #
  # Use `Gtk::CellAreaClass#install_cell_property` to install cell
  # properties for a cell area class and `Gtk::CellAreaClass#find_cell_property`
  # or `Gtk::CellAreaClass#list_cell_properties` to get information about
  # existing cell properties.
  #
  # To set the value of a cell property, use `Gtk::CellArea#cell_set_property`,
  # `Gtk::CellArea#cell_set` or `Gtk::CellArea#cell_set_valist`. To obtain
  # the value of a cell property, use `Gtk::CellArea#cell_get_property`
  # `Gtk::CellArea#cell_get` or `Gtk::CellArea#cell_get_valist`.
  @[GObject::GeneratedWrapper]
  class CellArea < GObject::InitiallyUnowned
    include Buildable
    include CellLayout

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::CellAreaClass), class_init,
        sizeof(LibGtk::CellArea), instance_init, 0)
    end

    GICrystal.define_new_method(CellArea, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CellArea`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, edit_widget : Gtk::CellEditable? = nil, edited_cell : Gtk::CellRenderer? = nil, focus_cell : Gtk::CellRenderer? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !edit_widget.nil?
        (_names.to_unsafe + _n).value = "edit-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, edit_widget)
        _n += 1
      end
      if !edited_cell.nil?
        (_names.to_unsafe + _n).value = "edited-cell".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, edited_cell)
        _n += 1
      end
      if !focus_cell.nil?
        (_names.to_unsafe + _n).value = "focus-cell".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_cell)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CellArea.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_area_get_type
    end

    def edit_widget : Gtk::CellEditable?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "edit-widget", pointerof(value), Pointer(Void).null)
      Gtk::AbstractCellEditable.new(value, GICrystal::Transfer::None) unless value.null?
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

    # Activates @area, usually by activating the currently focused
    # cell, however some subclasses which embed widgets in the area
    # can also activate a widget if it currently has the focus.
    def activate(context : Gtk::CellAreaContext, widget : Gtk::Widget, cell_area : Gdk::Rectangle, flags : Gtk::CellRendererState, edit_only : Bool) : Bool
      # gtk_cell_area_activate: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_activate(@pointer, context, widget, cell_area, flags, edit_only)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # This is used by `GtkCellArea` subclasses when handling events
    # to activate cells, the base `GtkCellArea` class activates cells
    # for keyboard events for free in its own GtkCellArea->activate()
    # implementation.
    def activate_cell(widget : Gtk::Widget, renderer : Gtk::CellRenderer, event : Gdk::Event, cell_area : Gdk::Rectangle, flags : Gtk::CellRendererState) : Bool
      # gtk_cell_area_activate_cell: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_activate_cell(@pointer, widget, renderer, event, cell_area, flags)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Adds @renderer to @area with the default child cell properties.
    def add(renderer : Gtk::CellRenderer) : Nil
      # gtk_cell_area_add: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_add(@pointer, renderer)

      # Return value handling
    end

    # Adds @sibling to @renderer’s focusable area, focus will be drawn
    # around @renderer and all of its siblings if @renderer can
    # focus for a given row.
    #
    # Events handled by focus siblings can also activate the given
    # focusable @renderer.
    def add_focus_sibling(renderer : Gtk::CellRenderer, sibling : Gtk::CellRenderer) : Nil
      # gtk_cell_area_add_focus_sibling: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_add_focus_sibling(@pointer, renderer, sibling)

      # Return value handling
    end

    # Applies any connected attributes to the renderers in
    # @area by pulling the values from @tree_model.
    def apply_attributes(tree_model : Gtk::TreeModel, iter : Gtk::TreeIter, is_expander : Bool, is_expanded : Bool) : Nil
      # gtk_cell_area_apply_attributes: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_apply_attributes(@pointer, tree_model, iter, is_expander, is_expanded)

      # Return value handling
    end

    # Connects an @attribute to apply values from @column for the
    # `GtkTreeModel` in use.
    def attribute_connect(renderer : Gtk::CellRenderer, attribute : ::String, column : Int32) : Nil
      # gtk_cell_area_attribute_connect: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_attribute_connect(@pointer, renderer, attribute, column)

      # Return value handling
    end

    # Disconnects @attribute for the @renderer in @area so that
    # attribute will no longer be updated with values from the
    # model.
    def attribute_disconnect(renderer : Gtk::CellRenderer, attribute : ::String) : Nil
      # gtk_cell_area_attribute_disconnect: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_attribute_disconnect(@pointer, renderer, attribute)

      # Return value handling
    end

    # Returns the model column that an attribute has been mapped to,
    # or -1 if the attribute is not mapped.
    def attribute_get_column(renderer : Gtk::CellRenderer, attribute : ::String) : Int32
      # gtk_cell_area_attribute_get_column: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_attribute_get_column(@pointer, renderer, attribute)

      # Return value handling

      _retval
    end

    # Gets the value of a cell property for @renderer in @area.
    def cell_get_property(renderer : Gtk::CellRenderer, property_name : ::String, value : _) : Nil
      # gtk_cell_area_cell_get_property: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      LibGtk.gtk_cell_area_cell_get_property(@pointer, renderer, property_name, value)

      # Return value handling
    end

    # Sets a cell property for @renderer in @area.
    def cell_set_property(renderer : Gtk::CellRenderer, property_name : ::String, value : _) : Nil
      # gtk_cell_area_cell_set_property: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      LibGtk.gtk_cell_area_cell_set_property(@pointer, renderer, property_name, value)

      # Return value handling
    end

    # This is sometimes needed for cases where rows need to share
    # alignments in one orientation but may be separately grouped
    # in the opposing orientation.
    #
    # For instance, `GtkIconView` creates all icons (rows) to have
    # the same width and the cells theirin to have the same
    # horizontal alignments. However each row of icons may have
    # a separate collective height. `GtkIconView` uses this to
    # request the heights of each row based on a context which
    # was already used to request all the row widths that are
    # to be displayed.
    def copy_context(context : Gtk::CellAreaContext) : Gtk::CellAreaContext
      # gtk_cell_area_copy_context: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_cell_area_copy_context(@pointer, context)

      # Return value handling

      Gtk::CellAreaContext.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a `GtkCellArea`Context to be used with @area for
    # all purposes. `GtkCellArea`Context stores geometry information
    # for rows for which it was operated on, it is important to use
    # the same context for the same row of data at all times (i.e.
    # one should render and handle events with the same `GtkCellArea`Context
    # which was used to request the size of those rows of data).
    def create_context : Gtk::CellAreaContext
      # gtk_cell_area_create_context: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_cell_area_create_context(@pointer)

      # Return value handling

      Gtk::CellAreaContext.new(_retval, GICrystal::Transfer::Full)
    end

    # Delegates event handling to a `GtkCellArea`.
    def event(context : Gtk::CellAreaContext, widget : Gtk::Widget, event : Gdk::Event, cell_area : Gdk::Rectangle, flags : Gtk::CellRendererState) : Int32
      # gtk_cell_area_event: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_event(@pointer, context, widget, event, cell_area, flags)

      # Return value handling

      _retval
    end

    # This should be called by the @area’s owning layout widget
    # when focus is to be passed to @area, or moved within @area
    # for a given @direction and row data.
    #
    # Implementing `GtkCellArea` classes should implement this
    # method to receive and navigate focus in its own way particular
    # to how it lays out cells.
    def focus(direction : Gtk::DirectionType) : Bool
      # gtk_cell_area_focus: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_focus(@pointer, direction)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Calls @callback for every `GtkCellRenderer` in @area.
    def foreach(callback : Gtk::CellCallback, callback_data : Pointer(Void)?) : Nil
      # gtk_cell_area_foreach: (Method)
      # @callback_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      callback_data = if callback_data.nil?
                        Pointer(Void).null
                      else
                        callback_data.to_unsafe
                      end

      # C call
      LibGtk.gtk_cell_area_foreach(@pointer, callback, callback_data)

      # Return value handling
    end

    # Calls @callback for every `GtkCellRenderer` in @area with the
    # allocated rectangle inside @cell_area.
    def foreach_alloc(context : Gtk::CellAreaContext, widget : Gtk::Widget, cell_area : Gdk::Rectangle, background_area : Gdk::Rectangle, callback : Gtk::CellAllocCallback, callback_data : Pointer(Void)?) : Nil
      # gtk_cell_area_foreach_alloc: (Method)
      # @callback_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      callback_data = if callback_data.nil?
                        Pointer(Void).null
                      else
                        callback_data.to_unsafe
                      end

      # C call
      LibGtk.gtk_cell_area_foreach_alloc(@pointer, context, widget, cell_area, background_area, callback, callback_data)

      # Return value handling
    end

    # Derives the allocation of @renderer inside @area if @area
    # were to be renderered in @cell_area.
    def cell_allocation(context : Gtk::CellAreaContext, widget : Gtk::Widget, renderer : Gtk::CellRenderer, cell_area : Gdk::Rectangle) : Gdk::Rectangle
      # gtk_cell_area_get_cell_allocation: (Method)
      # @allocation: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      allocation = Gdk::Rectangle.new
      # C call
      LibGtk.gtk_cell_area_get_cell_allocation(@pointer, context, widget, renderer, cell_area, allocation)

      # Return value handling

      allocation
    end

    # Gets the `GtkCellRenderer` at @x and @y coordinates inside @area and optionally
    # returns the full cell allocation for it inside @cell_area.
    def cell_at_position(context : Gtk::CellAreaContext, widget : Gtk::Widget, cell_area : Gdk::Rectangle, x : Int32, y : Int32) : Gdk::Rectangle
      # gtk_cell_area_get_cell_at_position: (Method)
      # @alloc_area: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      alloc_area = Pointer(Void).null # Generator::CallerAllocatesPlan
      alloc_area = Gdk::Rectangle.new
      # C call
      _retval = LibGtk.gtk_cell_area_get_cell_at_position(@pointer, context, widget, cell_area, x, y, alloc_area)

      # Return value handling

      alloc_area
    end

    # Gets the current `GtkTreePath` string for the currently
    # applied `GtkTreeIter`, this is implicitly updated when
    # gtk_cell_area_apply_attributes() is called and can be
    # used to interact with renderers from `GtkCellArea`
    # subclasses.
    def current_path_string : ::String
      # gtk_cell_area_get_current_path_string: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_get_current_path_string(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the `GtkCellEditable` widget currently used
    # to edit the currently edited cell.
    def edit_widget : Gtk::CellEditable?
      # gtk_cell_area_get_edit_widget: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_get_edit_widget(@pointer)

      # Return value handling

      Gtk::AbstractCellEditable.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the `GtkCellRenderer` in @area that is currently
    # being edited.
    def edited_cell : Gtk::CellRenderer?
      # gtk_cell_area_get_edited_cell: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_get_edited_cell(@pointer)

      # Return value handling

      Gtk::CellRenderer.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the currently focused cell for @area
    def focus_cell : Gtk::CellRenderer?
      # gtk_cell_area_get_focus_cell: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_get_focus_cell(@pointer)

      # Return value handling

      Gtk::CellRenderer.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the `GtkCellRenderer` which is expected to be focusable
    # for which @renderer is, or may be a sibling.
    #
    # This is handy for `GtkCellArea` subclasses when handling events,
    # after determining the renderer at the event location it can
    # then chose to activate the focus cell for which the event
    # cell may have been a sibling.
    def focus_from_sibling(renderer : Gtk::CellRenderer) : Gtk::CellRenderer?
      # gtk_cell_area_get_focus_from_sibling: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_get_focus_from_sibling(@pointer, renderer)

      # Return value handling

      Gtk::CellRenderer.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the focus sibling cell renderers for @renderer.
    def focus_siblings(renderer : Gtk::CellRenderer) : GLib::List
      # gtk_cell_area_get_focus_siblings: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_get_focus_siblings(@pointer, renderer)

      # Return value handling

      GLib::List(Gtk::CellRenderer).new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves a cell area’s initial minimum and natural height.
    #
    # @area will store some geometrical information in @context along the way;
    # when requesting sizes over an arbitrary number of rows, it’s not important
    # to check the @minimum_height and @natural_height of this call but rather to
    # consult gtk_cell_area_context_get_preferred_height() after a series of
    # requests.
    def preferred_height(context : Gtk::CellAreaContext, widget : Gtk::Widget) : Nil
      # gtk_cell_area_get_preferred_height: (Method)
      # @minimum_height: (out) (transfer full) (optional)
      # @natural_height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      minimum_height = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      natural_height = Pointer(Int32).null
      # C call
      LibGtk.gtk_cell_area_get_preferred_height(@pointer, context, widget, minimum_height, natural_height)

      # Return value handling
    end

    # Retrieves a cell area’s minimum and natural height if it would be given
    # the specified @width.
    #
    # @area stores some geometrical information in @context along the way
    # while calling gtk_cell_area_get_preferred_width(). It’s important to
    # perform a series of gtk_cell_area_get_preferred_width() requests with
    # @context first and then call gtk_cell_area_get_preferred_height_for_width()
    # on each cell area individually to get the height for width of each
    # fully requested row.
    #
    # If at some point, the width of a single row changes, it should be
    # requested with gtk_cell_area_get_preferred_width() again and then
    # the full width of the requested rows checked again with
    # gtk_cell_area_context_get_preferred_width().
    def preferred_height_for_width(context : Gtk::CellAreaContext, widget : Gtk::Widget, width : Int32) : Nil
      # gtk_cell_area_get_preferred_height_for_width: (Method)
      # @minimum_height: (out) (transfer full) (optional)
      # @natural_height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      minimum_height = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      natural_height = Pointer(Int32).null
      # C call
      LibGtk.gtk_cell_area_get_preferred_height_for_width(@pointer, context, widget, width, minimum_height, natural_height)

      # Return value handling
    end

    # Retrieves a cell area’s initial minimum and natural width.
    #
    # @area will store some geometrical information in @context along the way;
    # when requesting sizes over an arbitrary number of rows, it’s not important
    # to check the @minimum_width and @natural_width of this call but rather to
    # consult gtk_cell_area_context_get_preferred_width() after a series of
    # requests.
    def preferred_width(context : Gtk::CellAreaContext, widget : Gtk::Widget) : Nil
      # gtk_cell_area_get_preferred_width: (Method)
      # @minimum_width: (out) (transfer full) (optional)
      # @natural_width: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      minimum_width = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      natural_width = Pointer(Int32).null
      # C call
      LibGtk.gtk_cell_area_get_preferred_width(@pointer, context, widget, minimum_width, natural_width)

      # Return value handling
    end

    # Retrieves a cell area’s minimum and natural width if it would be given
    # the specified @height.
    #
    # @area stores some geometrical information in @context along the way
    # while calling gtk_cell_area_get_preferred_height(). It’s important to
    # perform a series of gtk_cell_area_get_preferred_height() requests with
    # @context first and then call gtk_cell_area_get_preferred_width_for_height()
    # on each cell area individually to get the height for width of each
    # fully requested row.
    #
    # If at some point, the height of a single row changes, it should be
    # requested with gtk_cell_area_get_preferred_height() again and then
    # the full height of the requested rows checked again with
    # gtk_cell_area_context_get_preferred_height().
    def preferred_width_for_height(context : Gtk::CellAreaContext, widget : Gtk::Widget, height : Int32) : Nil
      # gtk_cell_area_get_preferred_width_for_height: (Method)
      # @minimum_width: (out) (transfer full) (optional)
      # @natural_width: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      minimum_width = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      natural_width = Pointer(Int32).null
      # C call
      LibGtk.gtk_cell_area_get_preferred_width_for_height(@pointer, context, widget, height, minimum_width, natural_width)

      # Return value handling
    end

    # Gets whether the area prefers a height-for-width layout
    # or a width-for-height layout.
    def request_mode : Gtk::SizeRequestMode
      # gtk_cell_area_get_request_mode: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_get_request_mode(@pointer)

      # Return value handling

      Gtk::SizeRequestMode.new(_retval)
    end

    # Checks if @area contains @renderer.
    def has_renderer(renderer : Gtk::CellRenderer) : Bool
      # gtk_cell_area_has_renderer: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_has_renderer(@pointer, renderer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # This is a convenience function for `GtkCellArea` implementations
    # to get the inner area where a given `GtkCellRenderer` will be
    # rendered. It removes any padding previously added by gtk_cell_area_request_renderer().
    def inner_cell_area(widget : Gtk::Widget, cell_area : Gdk::Rectangle) : Gdk::Rectangle
      # gtk_cell_area_inner_cell_area: (Method)
      # @inner_area: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      inner_area = Gdk::Rectangle.new
      # C call
      LibGtk.gtk_cell_area_inner_cell_area(@pointer, widget, cell_area, inner_area)

      # Return value handling

      inner_area
    end

    # Returns whether the area can do anything when activated,
    # after applying new attributes to @area.
    def is_activatable : Bool
      # gtk_cell_area_is_activatable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_is_activatable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether @sibling is one of @renderer’s focus siblings
    # (see gtk_cell_area_add_focus_sibling()).
    def is_focus_sibling(renderer : Gtk::CellRenderer, sibling : Gtk::CellRenderer) : Bool
      # gtk_cell_area_is_focus_sibling: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_is_focus_sibling(@pointer, renderer, sibling)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Removes @renderer from @area.
    def remove(renderer : Gtk::CellRenderer) : Nil
      # gtk_cell_area_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_remove(@pointer, renderer)

      # Return value handling
    end

    # Removes @sibling from @renderer’s focus sibling list
    # (see gtk_cell_area_add_focus_sibling()).
    def remove_focus_sibling(renderer : Gtk::CellRenderer, sibling : Gtk::CellRenderer) : Nil
      # gtk_cell_area_remove_focus_sibling: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_remove_focus_sibling(@pointer, renderer, sibling)

      # Return value handling
    end

    # This is a convenience function for `GtkCellArea` implementations
    # to request size for cell renderers. It’s important to use this
    # function to request size and then use gtk_cell_area_inner_cell_area()
    # at render and event time since this function will add padding
    # around the cell for focus painting.
    def request_renderer(renderer : Gtk::CellRenderer, orientation : Gtk::Orientation, widget : Gtk::Widget, for_size : Int32) : Nil
      # gtk_cell_area_request_renderer: (Method)
      # @minimum_size: (out) (transfer full) (optional)
      # @natural_size: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      minimum_size = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      natural_size = Pointer(Int32).null
      # C call
      LibGtk.gtk_cell_area_request_renderer(@pointer, renderer, orientation, widget, for_size, minimum_size, natural_size)

      # Return value handling
    end

    # Explicitly sets the currently focused cell to @renderer.
    #
    # This is generally called by implementations of
    # `GtkCellAreaClass.focus()` or `GtkCellAreaClass.event()`,
    # however it can also be used to implement functions such
    # as gtk_tree_view_set_cursor_on_cell().
    def focus_cell=(renderer : Gtk::CellRenderer?) : Nil
      # gtk_cell_area_set_focus_cell: (Method | Setter)
      # @renderer: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      renderer = if renderer.nil?
                   Pointer(Void).null
                 else
                   renderer.to_unsafe
                 end

      # C call
      LibGtk.gtk_cell_area_set_focus_cell(@pointer, renderer)

      # Return value handling
    end

    # Snapshots @area’s cells according to @area’s layout onto at
    # the given coordinates.
    def snapshot(context : Gtk::CellAreaContext, widget : Gtk::Widget, snapshot : Gtk::Snapshot, background_area : Gdk::Rectangle, cell_area : Gdk::Rectangle, flags : Gtk::CellRendererState, paint_focus : Bool) : Nil
      # gtk_cell_area_snapshot: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_snapshot(@pointer, context, widget, snapshot, background_area, cell_area, flags, paint_focus)

      # Return value handling
    end

    # Explicitly stops the editing of the currently edited cell.
    #
    # If @canceled is %TRUE, the currently edited cell renderer
    # will emit the ::editing-canceled signal, otherwise the
    # the ::editing-done signal will be emitted on the current
    # edit widget.
    #
    # See gtk_cell_area_get_edited_cell() and gtk_cell_area_get_edit_widget().
    def stop_editing(canceled : Bool) : Nil
      # gtk_cell_area_stop_editing: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_stop_editing(@pointer, canceled)

      # Return value handling
    end

    # Indicates that editing has started on @renderer and that @editable
    # should be added to the owning cell-layouting widget at @cell_area.
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

      def connect(handler : Proc(Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_renderer : Pointer(Void), lib_editable : Pointer(Void), lib_cell_area : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          renderer = Gtk::CellRenderer.new(lib_renderer, :none)
          # Generator::BuiltInTypeArgPlan
          editable = Gtk::CellEditable.new(lib_editable, :none)
          # Generator::BuiltInTypeArgPlan
          cell_area = Gdk::Rectangle.new(lib_cell_area, :none)
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil)).unbox(_lib_box).call(renderer, editable, cell_area, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_renderer : Pointer(Void), lib_editable : Pointer(Void), lib_cell_area : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          renderer = Gtk::CellRenderer.new(lib_renderer, :none)
          # Generator::BuiltInTypeArgPlan
          editable = Gtk::CellEditable.new(lib_editable, :none)
          # Generator::BuiltInTypeArgPlan
          cell_area = Gdk::Rectangle.new(lib_cell_area, :none)
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil)).unbox(_lib_box).call(renderer, editable, cell_area, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_renderer : Pointer(Void), lib_editable : Pointer(Void), lib_cell_area : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::CellArea.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          renderer = Gtk::CellRenderer.new(lib_renderer, :none)
          # Generator::BuiltInTypeArgPlan
          editable = Gtk::CellEditable.new(lib_editable, :none)
          # Generator::BuiltInTypeArgPlan
          cell_area = Gdk::Rectangle.new(lib_cell_area, :none)
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil)).unbox(_lib_box).call(_sender, renderer, editable, cell_area, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_renderer : Pointer(Void), lib_editable : Pointer(Void), lib_cell_area : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::CellArea.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          renderer = Gtk::CellRenderer.new(lib_renderer, :none)
          # Generator::BuiltInTypeArgPlan
          editable = Gtk::CellEditable.new(lib_editable, :none)
          # Generator::BuiltInTypeArgPlan
          cell_area = Gdk::Rectangle.new(lib_cell_area, :none)
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, ::String, Nil)).unbox(_lib_box).call(_sender, renderer, editable, cell_area, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(renderer : Gtk::CellRenderer, editable : Gtk::CellEditable, cell_area : Gdk::Rectangle, path : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "add-editable", renderer, editable, cell_area, path)
      end
    end

    def add_editable_signal
      AddEditableSignal.new(self)
    end

    # This signal is emitted whenever applying attributes to @area from @model
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

      def connect(handler : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_model : Pointer(Void), lib_iter : Pointer(Void), lib_is_expander : LibC::Int, lib_is_expanded : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          model = Gtk::TreeModel.new(lib_model, :none)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          is_expander = lib_is_expander
          is_expanded = lib_is_expanded
          ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil)).unbox(_lib_box).call(model, iter, is_expander, is_expanded)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_model : Pointer(Void), lib_iter : Pointer(Void), lib_is_expander : LibC::Int, lib_is_expanded : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          model = Gtk::TreeModel.new(lib_model, :none)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          is_expander = lib_is_expander
          is_expanded = lib_is_expanded
          ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil)).unbox(_lib_box).call(model, iter, is_expander, is_expanded)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::CellArea, Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_model : Pointer(Void), lib_iter : Pointer(Void), lib_is_expander : LibC::Int, lib_is_expanded : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::CellArea.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          model = Gtk::TreeModel.new(lib_model, :none)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          is_expander = lib_is_expander
          is_expanded = lib_is_expanded
          ::Box(Proc(Gtk::CellArea, Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil)).unbox(_lib_box).call(_sender, model, iter, is_expander, is_expanded)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::CellArea, Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_model : Pointer(Void), lib_iter : Pointer(Void), lib_is_expander : LibC::Int, lib_is_expanded : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::CellArea.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          model = Gtk::TreeModel.new(lib_model, :none)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          is_expander = lib_is_expander
          is_expanded = lib_is_expanded
          ::Box(Proc(Gtk::CellArea, Gtk::TreeModel, Gtk::TreeIter, Bool, Bool, Nil)).unbox(_lib_box).call(_sender, model, iter, is_expander, is_expanded)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(model : Gtk::TreeModel, iter : Gtk::TreeIter, is_expander : Bool, is_expanded : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "apply-attributes", model, iter, is_expander, is_expanded)
      end
    end

    def apply_attributes_signal
      ApplyAttributesSignal.new(self)
    end

    # Indicates that focus changed on this @area. This signal
    # is emitted either as a result of focus handling or event
    # handling.
    #
    # It's possible that the signal is emitted even if the
    # currently focused renderer did not change, this is
    # because focus may change to the same renderer in the
    # same cell area for a different row of data.
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

      def connect(handler : Proc(Gtk::CellRenderer, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_renderer : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          renderer = Gtk::CellRenderer.new(lib_renderer, :none)
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(Gtk::CellRenderer, ::String, Nil)).unbox(_lib_box).call(renderer, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::CellRenderer, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_renderer : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          renderer = Gtk::CellRenderer.new(lib_renderer, :none)
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(Gtk::CellRenderer, ::String, Nil)).unbox(_lib_box).call(renderer, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::CellArea, Gtk::CellRenderer, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_renderer : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::CellArea.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          renderer = Gtk::CellRenderer.new(lib_renderer, :none)
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(Gtk::CellArea, Gtk::CellRenderer, ::String, Nil)).unbox(_lib_box).call(_sender, renderer, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::CellArea, Gtk::CellRenderer, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_renderer : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::CellArea.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          renderer = Gtk::CellRenderer.new(lib_renderer, :none)
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(Gtk::CellArea, Gtk::CellRenderer, ::String, Nil)).unbox(_lib_box).call(_sender, renderer, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(renderer : Gtk::CellRenderer, path : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "focus-changed", renderer, path)
      end
    end

    def focus_changed_signal
      FocusChangedSignal.new(self)
    end

    # Indicates that editing finished on @renderer and that @editable
    # should be removed from the owning cell-layouting widget.
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

      def connect(handler : Proc(Gtk::CellRenderer, Gtk::CellEditable, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_renderer : Pointer(Void), lib_editable : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          renderer = Gtk::CellRenderer.new(lib_renderer, :none)
          # Generator::BuiltInTypeArgPlan
          editable = Gtk::CellEditable.new(lib_editable, :none)
          ::Box(Proc(Gtk::CellRenderer, Gtk::CellEditable, Nil)).unbox(_lib_box).call(renderer, editable)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::CellRenderer, Gtk::CellEditable, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_renderer : Pointer(Void), lib_editable : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          renderer = Gtk::CellRenderer.new(lib_renderer, :none)
          # Generator::BuiltInTypeArgPlan
          editable = Gtk::CellEditable.new(lib_editable, :none)
          ::Box(Proc(Gtk::CellRenderer, Gtk::CellEditable, Nil)).unbox(_lib_box).call(renderer, editable)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_renderer : Pointer(Void), lib_editable : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::CellArea.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          renderer = Gtk::CellRenderer.new(lib_renderer, :none)
          # Generator::BuiltInTypeArgPlan
          editable = Gtk::CellEditable.new(lib_editable, :none)
          ::Box(Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Nil)).unbox(_lib_box).call(_sender, renderer, editable)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_renderer : Pointer(Void), lib_editable : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::CellArea.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          renderer = Gtk::CellRenderer.new(lib_renderer, :none)
          # Generator::BuiltInTypeArgPlan
          editable = Gtk::CellEditable.new(lib_editable, :none)
          ::Box(Proc(Gtk::CellArea, Gtk::CellRenderer, Gtk::CellEditable, Nil)).unbox(_lib_box).call(_sender, renderer, editable)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
