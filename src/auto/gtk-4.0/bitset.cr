module Gtk
  # A `GtkBitset` represents a set of unsigned integers.
  #
  # Another name for this data structure is "bitmap".
  #
  # The current implementation is based on [roaring bitmaps](https://roaringbitmap.org/).
  #
  # A bitset allows adding a set of integers and provides support for set operations
  # like unions, intersections and checks for equality or if a value is contained
  # in the set. `GtkBitset` also contains various functions to query metadata about
  # the bitset, such as the minimum or maximum values or its size.
  #
  # The fastest way to iterate values in a bitset is [struct@Gtk.BitsetIter].
  #
  # The main use case for `GtkBitset` is implementing complex selections for
  # [iface@Gtk.SelectionModel].
  class Bitset
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(Bitset.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(Bitset.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_bitset_get_type
    end

    def self.new_empty : Gtk::Bitset
      # gtk_bitset_new_empty: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_bitset_new_empty
      Gtk::Bitset.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_range(start : UInt32, n_items : UInt32) : Gtk::Bitset
      # gtk_bitset_new_range: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_bitset_new_range(start, n_items)
      Gtk::Bitset.new(_retval, GICrystal::Transfer::Full)
    end

    def add(value : UInt32) : Bool
      # gtk_bitset_add: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_add(self, value)
      GICrystal.to_bool(_retval)
    end

    def add_range(start : UInt32, n_items : UInt32) : Nil
      # gtk_bitset_add_range: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_add_range(self, start, n_items)
    end

    def add_range_closed(first : UInt32, last : UInt32) : Nil
      # gtk_bitset_add_range_closed: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_add_range_closed(self, first, last)
    end

    def add_rectangle(start : UInt32, width : UInt32, height : UInt32, stride : UInt32) : Nil
      # gtk_bitset_add_rectangle: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_add_rectangle(self, start, width, height, stride)
    end

    def contains(value : UInt32) : Bool
      # gtk_bitset_contains: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_contains(self, value)
      GICrystal.to_bool(_retval)
    end

    def copy : Gtk::Bitset
      # gtk_bitset_copy: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_bitset_copy(self)
      Gtk::Bitset.new(_retval, GICrystal::Transfer::Full)
    end

    def difference(other : Gtk::Bitset) : Nil
      # gtk_bitset_difference: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_difference(self, other)
    end

    def equals(other : Gtk::Bitset) : Bool
      # gtk_bitset_equals: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_equals(self, other)
      GICrystal.to_bool(_retval)
    end

    def maximum : UInt32
      # gtk_bitset_get_maximum: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_get_maximum(self)
      _retval
    end

    def minimum : UInt32
      # gtk_bitset_get_minimum: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_get_minimum(self)
      _retval
    end

    def nth(nth : UInt32) : UInt32
      # gtk_bitset_get_nth: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_get_nth(self, nth)
      _retval
    end

    def size : UInt64
      # gtk_bitset_get_size: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_get_size(self)
      _retval
    end

    def size_in_range(first : UInt32, last : UInt32) : UInt64
      # gtk_bitset_get_size_in_range: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_get_size_in_range(self, first, last)
      _retval
    end

    def intersect(other : Gtk::Bitset) : Nil
      # gtk_bitset_intersect: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_intersect(self, other)
    end

    def is_empty : Bool
      # gtk_bitset_is_empty: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_is_empty(self)
      GICrystal.to_bool(_retval)
    end

    def ref : Gtk::Bitset
      # gtk_bitset_ref: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_ref(self)
      Gtk::Bitset.new(_retval, GICrystal::Transfer::None)
    end

    def remove(value : UInt32) : Bool
      # gtk_bitset_remove: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_remove(self, value)
      GICrystal.to_bool(_retval)
    end

    def remove_all : Nil
      # gtk_bitset_remove_all: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_remove_all(self)
    end

    def remove_range(start : UInt32, n_items : UInt32) : Nil
      # gtk_bitset_remove_range: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_remove_range(self, start, n_items)
    end

    def remove_range_closed(first : UInt32, last : UInt32) : Nil
      # gtk_bitset_remove_range_closed: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_remove_range_closed(self, first, last)
    end

    def remove_rectangle(start : UInt32, width : UInt32, height : UInt32, stride : UInt32) : Nil
      # gtk_bitset_remove_rectangle: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_remove_rectangle(self, start, width, height, stride)
    end

    def shift_left(amount : UInt32) : Nil
      # gtk_bitset_shift_left: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_shift_left(self, amount)
    end

    def shift_right(amount : UInt32) : Nil
      # gtk_bitset_shift_right: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_shift_right(self, amount)
    end

    def splice(position : UInt32, removed : UInt32, added : UInt32) : Nil
      # gtk_bitset_splice: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_splice(self, position, removed, added)
    end

    def subtract(other : Gtk::Bitset) : Nil
      # gtk_bitset_subtract: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_subtract(self, other)
    end

    def union(other : Gtk::Bitset) : Nil
      # gtk_bitset_union: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_union(self, other)
    end

    def unref : Nil
      # gtk_bitset_unref: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_bitset_unref(self)
    end

    def to_unsafe
      @pointer
    end
  end
end
