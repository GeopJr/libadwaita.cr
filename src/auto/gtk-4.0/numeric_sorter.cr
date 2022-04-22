require "./sorter"

module Gtk
  # `GtkNumericSorter` is a `GtkSorter` that compares numbers.
  #
  # To obtain the numbers to compare, this sorter evaluates a
  # `Gtk#Expression`.
  @[GObject::GeneratedWrapper]
  class NumericSorter < Sorter
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::NumericSorterClass), class_init,
        sizeof(LibGtk::NumericSorter), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, expression : Gtk::Expression? = nil, sort_order : Gtk::SortType? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !expression.nil?
        (_names.to_unsafe + _n).value = "expression".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expression)
        _n += 1
      end
      if !sort_order.nil?
        (_names.to_unsafe + _n).value = "sort-order".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sort_order)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NumericSorter.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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
      Gtk::SortType.new(value)
    end

    # Creates a new numeric sorter using the given @expression.
    #
    # Smaller numbers will be sorted first. You can call
    # `Gtk::NumericSorter#sort_order=` to change this.
    def initialize(expression : Gtk::Expression?)
      # gtk_numeric_sorter_new: (Constructor)
      # @expression: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end

      # Generator::TransferFullArgPlan
      LibGObject.gtk_expression_ref(expression)

      # C call
      _retval = LibGtk.gtk_numeric_sorter_new(expression)

      # Return value handling

      @pointer = _retval
    end

    # Gets the expression that is evaluated to obtain numbers from items.
    def expression : Gtk::Expression?
      # gtk_numeric_sorter_get_expression: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_numeric_sorter_get_expression(self)

      # Return value handling

      Gtk::Expression.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether this sorter will sort smaller numbers first.
    def sort_order : Gtk::SortType
      # gtk_numeric_sorter_get_sort_order: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_numeric_sorter_get_sort_order(self)

      # Return value handling

      Gtk::SortType.new(_retval)
    end

    # Sets the expression that is evaluated to obtain numbers from items.
    #
    # Unless an expression is set on @self, the sorter will always
    # compare items as invalid.
    #
    # The expression must have a return type that can be compared
    # numerically, such as %G_TYPE_INT or %G_TYPE_DOUBLE.
    def expression=(expression : Gtk::Expression?) : Nil
      # gtk_numeric_sorter_set_expression: (Method | Setter)
      # @expression: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end

      # C call
      LibGtk.gtk_numeric_sorter_set_expression(self, expression)

      # Return value handling
    end

    # Sets whether to sort smaller numbers before larger ones.
    def sort_order=(sort_order : Gtk::SortType) : Nil
      # gtk_numeric_sorter_set_sort_order: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_numeric_sorter_set_sort_order(self, sort_order)

      # Return value handling
    end
  end
end
