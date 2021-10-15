require "./layout_manager"

module Gtk
  # `GtkCenterLayout` is a layout manager that manages up to three children.
  #
  # The start widget is allocated at the start of the layout (left in
  # left-to-right locales and right in right-to-left ones), and the end
  # widget at the end.
  #
  # The center widget is centered regarding the full width of the layout's.
  class CenterLayout < LayoutManager
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_center_layout_get_type
    end

    def initialize
      # gtk_center_layout_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_center_layout_new
      @pointer = _retval
    end

    def baseline_position : Gtk::BaselinePosition
      # gtk_center_layout_get_baseline_position: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_center_layout_get_baseline_position(self)
      Gtk::BaselinePosition.from_value(_retval)
    end

    def center_widget : Gtk::Widget?
      # gtk_center_layout_get_center_widget: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_center_layout_get_center_widget(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def end_widget : Gtk::Widget?
      # gtk_center_layout_get_end_widget: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_center_layout_get_end_widget(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def orientation : Gtk::Orientation
      # gtk_center_layout_get_orientation: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_center_layout_get_orientation(self)
      Gtk::Orientation.from_value(_retval)
    end

    def start_widget : Gtk::Widget?
      # gtk_center_layout_get_start_widget: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_center_layout_get_start_widget(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def baseline_position=(baseline_position : Gtk::BaselinePosition) : Nil
      # gtk_center_layout_set_baseline_position: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_center_layout_set_baseline_position(self, baseline_position)
    end

    def center_widget=(widget : Gtk::Widget?) : Nil
      # gtk_center_layout_set_center_widget: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      LibGtk.gtk_center_layout_set_center_widget(self, widget)
    end

    def end_widget=(widget : Gtk::Widget?) : Nil
      # gtk_center_layout_set_end_widget: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      LibGtk.gtk_center_layout_set_end_widget(self, widget)
    end

    def orientation=(orientation : Gtk::Orientation) : Nil
      # gtk_center_layout_set_orientation: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_center_layout_set_orientation(self, orientation)
    end

    def start_widget=(widget : Gtk::Widget?) : Nil
      # gtk_center_layout_set_start_widget: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      LibGtk.gtk_center_layout_set_start_widget(self, widget)
    end
  end
end
