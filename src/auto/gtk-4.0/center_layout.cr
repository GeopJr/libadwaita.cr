require "./layout_manager"

module Gtk
  # `GtkCenterLayout` is a layout manager that manages up to three children.
  #
  # The start widget is allocated at the start of the layout (left in
  # left-to-right locales and right in right-to-left ones), and the end
  # widget at the end.
  #
  # The center widget is centered regarding the full width of the layout's.
  @[GObject::GeneratedWrapper]
  class CenterLayout < LayoutManager
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::CenterLayoutClass), class_init,
        sizeof(LibGtk::CenterLayout), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_center_layout_get_type
    end

    # Creates a new `GtkCenterLayout`.
    def initialize
      # gtk_center_layout_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_center_layout_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the baseline position of the layout.
    def baseline_position : Gtk::BaselinePosition
      # gtk_center_layout_get_baseline_position: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_center_layout_get_baseline_position(self)

      # Return value handling

      Gtk::BaselinePosition.new(_retval)
    end

    # Returns the center widget of the layout.
    def center_widget : Gtk::Widget?
      # gtk_center_layout_get_center_widget: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_center_layout_get_center_widget(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the end widget of the layout.
    def end_widget : Gtk::Widget?
      # gtk_center_layout_get_end_widget: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_center_layout_get_end_widget(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the current orienration of the layout manager.
    def orientation : Gtk::Orientation
      # gtk_center_layout_get_orientation: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_center_layout_get_orientation(self)

      # Return value handling

      Gtk::Orientation.new(_retval)
    end

    # Returns the start widget fo the layout.
    def start_widget : Gtk::Widget?
      # gtk_center_layout_get_start_widget: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_center_layout_get_start_widget(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets the new baseline position of @self
    def baseline_position=(baseline_position : Gtk::BaselinePosition) : Nil
      # gtk_center_layout_set_baseline_position: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_center_layout_set_baseline_position(self, baseline_position)

      # Return value handling
    end

    # Sets the new center widget of @self.
    #
    # To remove the existing center widget, pass %NULL.
    def center_widget=(widget : Gtk::Widget?) : Nil
      # gtk_center_layout_set_center_widget: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibGtk.gtk_center_layout_set_center_widget(self, widget)

      # Return value handling
    end

    # Sets the new end widget of @self.
    #
    # To remove the existing center widget, pass %NULL.
    def end_widget=(widget : Gtk::Widget?) : Nil
      # gtk_center_layout_set_end_widget: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibGtk.gtk_center_layout_set_end_widget(self, widget)

      # Return value handling
    end

    # Sets the orientation of @self.
    def orientation=(orientation : Gtk::Orientation) : Nil
      # gtk_center_layout_set_orientation: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_center_layout_set_orientation(self, orientation)

      # Return value handling
    end

    # Sets the new start widget of @self.
    #
    # To remove the existing start widget, pass %NULL.
    def start_widget=(widget : Gtk::Widget?) : Nil
      # gtk_center_layout_set_start_widget: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibGtk.gtk_center_layout_set_start_widget(self, widget)

      # Return value handling
    end
  end
end
