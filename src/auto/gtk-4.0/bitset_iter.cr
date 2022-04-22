module Gtk
  # An opaque, stack-allocated struct for iterating
  # over the elements of a `GtkBitset`.
  #
  # Before a `GtkBitsetIter` can be used, it needs to be initialized with
  # `Gtk::BitsetIter#init_first`, `Gtk::BitsetIter#init_last`
  # or `Gtk::BitsetIter#init_at`.
  class BitsetIter
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::BitsetIter))
      @pointer.copy_from(pointer, sizeof(LibGtk::BitsetIter))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(private_data : Enumerable(Pointer(Void))? = nil)
      _ptr = Pointer(Void).malloc(80)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.private_data = private_data unless private_data.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGtk::BitsetIter)).zero?
    end

    def private_data : Enumerable(Pointer(Void))
      _var = (@pointer + 0).as(Pointer(Pointer(Void)[10]))
      _var.value
    end

    def private_data=(value : Enumerable(Pointer(Void)))
      _var = (@pointer + 0).as(Pointer(Pointer(Void)[10])).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_bitset_iter_get_type
    end

    def value : UInt32
      # gtk_bitset_iter_get_value: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_bitset_iter_get_value(self)

      # Return value handling

      _retval
    end

    def is_valid : Bool
      # gtk_bitset_iter_is_valid: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_bitset_iter_is_valid(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def _next : Bool
      # gtk_bitset_iter_next: (Method)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      value = Pointer(UInt32).null

      # C call
      _retval = LibGtk.gtk_bitset_iter_next(self, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def previous : Bool
      # gtk_bitset_iter_previous: (Method)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      value = Pointer(UInt32).null

      # C call
      _retval = LibGtk.gtk_bitset_iter_previous(self, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def self.init_at(set : Gtk::Bitset, target : UInt32) : Gtk::BitsetIter
      # gtk_bitset_iter_init_at: (None)
      # @iter: (out) (caller-allocates)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::BitsetIter.new
      # Generator::OutArgUsedInReturnPlan
      value = Pointer(UInt32).null

      # C call
      _retval = LibGtk.gtk_bitset_iter_init_at(iter, set, target, value)

      # Return value handling

      iter
    end

    def self.init_first(set : Gtk::Bitset) : Gtk::BitsetIter
      # gtk_bitset_iter_init_first: (None)
      # @iter: (out) (caller-allocates)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::BitsetIter.new
      # Generator::OutArgUsedInReturnPlan
      value = Pointer(UInt32).null

      # C call
      _retval = LibGtk.gtk_bitset_iter_init_first(iter, set, value)

      # Return value handling

      iter
    end

    def self.init_last(set : Gtk::Bitset) : Gtk::BitsetIter
      # gtk_bitset_iter_init_last: (None)
      # @iter: (out) (caller-allocates)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::BitsetIter.new
      # Generator::OutArgUsedInReturnPlan
      value = Pointer(UInt32).null

      # C call
      _retval = LibGtk.gtk_bitset_iter_init_last(iter, set, value)

      # Return value handling

      iter
    end

    def to_unsafe
      @pointer
    end
  end
end
