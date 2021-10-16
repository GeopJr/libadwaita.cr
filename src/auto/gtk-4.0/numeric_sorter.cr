require "./sorter"

module Gtk
  # `GtkNumericSorter` is a `GtkSorter` that compares numbers.
  #
  # To obtain the numbers to compare, this sorter evaluates a
  # [class@Gtk.Expression].
  class NumericSorter < Sorter
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, expression : Gtk::Expression? = nil, sort_order : Gtk::SortType? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if expression
        (_names.to_unsafe + _n).value = "expression".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expression)
        _n += 1
      end
      if sort_order
        (_names.to_unsafe + _n).value = "sort-order".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sort_order)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NumericSorter.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_numeric_sorter_get_type
    end

    def expression=(value : Gtk::Expression?) : Gtk::Expression?
      unsafe_value = value

      LibGObject.g_object_set(self, "expression", unsafe_value, Pointer(Void).null)
      value
    end

    def expression : Gtk::Expression?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "expression", pointerof(value), Pointer(Void).null)
      Gtk::Expression.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def sort_order=(value : Gtk::SortType) : Gtk::SortType
      unsafe_value = value

      LibGObject.g_object_set(self, "sort-order", unsafe_value, Pointer(Void).null)
      value
    end

    def sort_order : Gtk::SortType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "sort-order", pointerof(value), Pointer(Void).null)
      Gtk::SortType.from_value(value)
    end

    def initialize(expression : Gtk::Expression?)
      # gtk_numeric_sorter_new: (Constructor)
      # @expression: (transfer full) (nullable)
      # Returns: (transfer full)

      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end
      LibGObject.g_object_ref(expression)

      _retval = LibGtk.gtk_numeric_sorter_new(expression)
      @pointer = _retval
    end

    def expression : Gtk::Expression?
      # gtk_numeric_sorter_get_expression: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_numeric_sorter_get_expression(self)
      Gtk::Expression.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def sort_order : Gtk::SortType
      # gtk_numeric_sorter_get_sort_order: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_numeric_sorter_get_sort_order(self)
      Gtk::SortType.from_value(_retval)
    end

    def expression=(expression : Gtk::Expression?) : Nil
      # gtk_numeric_sorter_set_expression: (Method)
      # @expression: (nullable)
      # Returns: (transfer none)

      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end

      LibGtk.gtk_numeric_sorter_set_expression(self, expression)
    end

    def sort_order=(sort_order : Gtk::SortType) : Nil
      # gtk_numeric_sorter_set_sort_order: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_numeric_sorter_set_sort_order(self, sort_order)
    end
  end
end
