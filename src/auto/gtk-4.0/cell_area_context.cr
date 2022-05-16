require "../g_object-2.0/object"

module Gtk
  # Stores geometrical information for a series of rows in a GtkCellArea
  #
  # The `GtkCellAreaContext` object is created by a given `GtkCellArea`
  # implementation via its `GtkCellAreaClass.create_context()` virtual
  # method and is used to store cell sizes and alignments for a series of
  # `GtkTreeModel` rows that are requested and rendered in the same context.
  #
  # `GtkCellLayout` widgets can create any number of contexts in which to
  # request and render groups of data rows. However, it’s important that the
  # same context which was used to request sizes for a given `GtkTreeModel`
  # row also be used for the same row when calling other `GtkCellArea` APIs
  # such as gtk_cell_area_render() and gtk_cell_area_event().
  @[GObject::GeneratedWrapper]
  class CellAreaContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::CellAreaContextClass), class_init,
        sizeof(LibGtk::CellAreaContext), instance_init, 0)
    end

    GICrystal.define_new_method(CellAreaContext, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CellAreaContext`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, area : Gtk::CellArea? = nil, minimum_height : Int32? = nil, minimum_width : Int32? = nil, natural_height : Int32? = nil, natural_width : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !area.nil?
        (_names.to_unsafe + _n).value = "area".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, area)
        _n += 1
      end
      if !minimum_height.nil?
        (_names.to_unsafe + _n).value = "minimum-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, minimum_height)
        _n += 1
      end
      if !minimum_width.nil?
        (_names.to_unsafe + _n).value = "minimum-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, minimum_width)
        _n += 1
      end
      if !natural_height.nil?
        (_names.to_unsafe + _n).value = "natural-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, natural_height)
        _n += 1
      end
      if !natural_width.nil?
        (_names.to_unsafe + _n).value = "natural-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, natural_width)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CellAreaContext.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_area_context_get_type
    end

    def area=(value : Gtk::CellArea?) : Gtk::CellArea?
      unsafe_value = value

      LibGObject.g_object_set(self, "area", unsafe_value, Pointer(Void).null)
      value
    end

    def area : Gtk::CellArea?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "area", pointerof(value), Pointer(Void).null)
      Gtk::CellArea.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def minimum_height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "minimum-height", pointerof(value), Pointer(Void).null)
      value
    end

    def minimum_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "minimum-width", pointerof(value), Pointer(Void).null)
      value
    end

    def natural_height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "natural-height", pointerof(value), Pointer(Void).null)
      value
    end

    def natural_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "natural-width", pointerof(value), Pointer(Void).null)
      value
    end

    # Allocates a width and/or a height for all rows which are to be
    # rendered with @context.
    #
    # Usually allocation is performed only horizontally or sometimes
    # vertically since a group of rows are usually rendered side by
    # side vertically or horizontally and share either the same width
    # or the same height. Sometimes they are allocated in both horizontal
    # and vertical orientations producing a homogeneous effect of the
    # rows. This is generally the case for `GtkTreeView` when
    # `GtkTreeView:fixed-height-mode` is enabled.
    def allocate(width : Int32, height : Int32) : Nil
      # gtk_cell_area_context_allocate: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_context_allocate(@pointer, width, height)

      # Return value handling
    end

    # Fetches the current allocation size for @context.
    #
    # If the context was not allocated in width or height, or if the
    # context was recently reset with gtk_cell_area_context_reset(),
    # the returned value will be -1.
    def allocation : Nil
      # gtk_cell_area_context_get_allocation: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      width = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      height = Pointer(Int32).null
      # C call
      LibGtk.gtk_cell_area_context_get_allocation(@pointer, width, height)

      # Return value handling
    end

    # Fetches the `GtkCellArea` this @context was created by.
    #
    # This is generally unneeded by layouting widgets; however,
    # it is important for the context implementation itself to
    # fetch information about the area it is being used for.
    #
    # For instance at `GtkCellAreaContextClass.allocate()` time
    # it’s important to know details about any cell spacing
    # that the `GtkCellArea` is configured with in order to
    # compute a proper allocation.
    def area : Gtk::CellArea
      # gtk_cell_area_context_get_area: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_context_get_area(@pointer)

      # Return value handling

      Gtk::CellArea.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the accumulative preferred height for all rows which have been
    # requested with this context.
    #
    # After gtk_cell_area_context_reset() is called and/or before ever
    # requesting the size of a `GtkCellArea`, the returned values are 0.
    def preferred_height : Nil
      # gtk_cell_area_context_get_preferred_height: (Method)
      # @minimum_height: (out) (transfer full) (optional)
      # @natural_height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      minimum_height = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      natural_height = Pointer(Int32).null
      # C call
      LibGtk.gtk_cell_area_context_get_preferred_height(@pointer, minimum_height, natural_height)

      # Return value handling
    end

    # Gets the accumulative preferred height for @width for all rows
    # which have been requested for the same said @width with this context.
    #
    # After gtk_cell_area_context_reset() is called and/or before ever
    # requesting the size of a `GtkCellArea`, the returned values are -1.
    def preferred_height_for_width(width : Int32) : Nil
      # gtk_cell_area_context_get_preferred_height_for_width: (Method)
      # @minimum_height: (out) (transfer full) (optional)
      # @natural_height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      minimum_height = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      natural_height = Pointer(Int32).null
      # C call
      LibGtk.gtk_cell_area_context_get_preferred_height_for_width(@pointer, width, minimum_height, natural_height)

      # Return value handling
    end

    # Gets the accumulative preferred width for all rows which have been
    # requested with this context.
    #
    # After gtk_cell_area_context_reset() is called and/or before ever
    # requesting the size of a `GtkCellArea`, the returned values are 0.
    def preferred_width : Nil
      # gtk_cell_area_context_get_preferred_width: (Method)
      # @minimum_width: (out) (transfer full) (optional)
      # @natural_width: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      minimum_width = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      natural_width = Pointer(Int32).null
      # C call
      LibGtk.gtk_cell_area_context_get_preferred_width(@pointer, minimum_width, natural_width)

      # Return value handling
    end

    # Gets the accumulative preferred width for @height for all rows which
    # have been requested for the same said @height with this context.
    #
    # After gtk_cell_area_context_reset() is called and/or before ever
    # requesting the size of a `GtkCellArea`, the returned values are -1.
    def preferred_width_for_height(height : Int32) : Nil
      # gtk_cell_area_context_get_preferred_width_for_height: (Method)
      # @minimum_width: (out) (transfer full) (optional)
      # @natural_width: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      minimum_width = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      natural_width = Pointer(Int32).null
      # C call
      LibGtk.gtk_cell_area_context_get_preferred_width_for_height(@pointer, height, minimum_width, natural_width)

      # Return value handling
    end

    # Causes the minimum and/or natural height to grow if the new
    # proposed sizes exceed the current minimum and natural height.
    #
    # This is used by `GtkCellAreaContext` implementations during
    # the request process over a series of `GtkTreeModel` rows to
    # progressively push the requested height over a series of
    # gtk_cell_area_get_preferred_height() requests.
    def push_preferred_height(minimum_height : Int32, natural_height : Int32) : Nil
      # gtk_cell_area_context_push_preferred_height: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_context_push_preferred_height(@pointer, minimum_height, natural_height)

      # Return value handling
    end

    # Causes the minimum and/or natural width to grow if the new
    # proposed sizes exceed the current minimum and natural width.
    #
    # This is used by `GtkCellAreaContext` implementations during
    # the request process over a series of `GtkTreeModel` rows to
    # progressively push the requested width over a series of
    # gtk_cell_area_get_preferred_width() requests.
    def push_preferred_width(minimum_width : Int32, natural_width : Int32) : Nil
      # gtk_cell_area_context_push_preferred_width: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_context_push_preferred_width(@pointer, minimum_width, natural_width)

      # Return value handling
    end

    # Resets any previously cached request and allocation
    # data.
    #
    # When underlying `GtkTreeModel` data changes its
    # important to reset the context if the content
    # size is allowed to shrink. If the content size
    # is only allowed to grow (this is usually an option
    # for views rendering large data stores as a measure
    # of optimization), then only the row that changed
    # or was inserted needs to be (re)requested with
    # gtk_cell_area_get_preferred_width().
    #
    # When the new overall size of the context requires
    # that the allocated size changes (or whenever this
    # allocation changes at all), the variable row
    # sizes need to be re-requested for every row.
    #
    # For instance, if the rows are displayed all with
    # the same width from top to bottom then a change
    # in the allocated width necessitates a recalculation
    # of all the displayed row heights using
    # gtk_cell_area_get_preferred_height_for_width().
    def reset : Nil
      # gtk_cell_area_context_reset: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_context_reset(@pointer)

      # Return value handling
    end
  end
end
