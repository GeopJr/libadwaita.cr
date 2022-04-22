module Gtk
  # The `GtkTreeIter` is the primary structure
  # for accessing a `GtkTreeModel`. Models are expected to put a unique
  # integer in the @stamp member, and put
  # model-specific data in the three @user_data
  # members.
  class TreeIter
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::TreeIter))
      @pointer.copy_from(pointer, sizeof(LibGtk::TreeIter))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(stamp : Int32? = nil, user_data : Pointer(Void)? = nil, user_data2 : Pointer(Void)? = nil, user_data3 : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.stamp = stamp unless stamp.nil?
      _instance.user_data = user_data unless user_data.nil?
      _instance.user_data2 = user_data2 unless user_data2.nil?
      _instance.user_data3 = user_data3 unless user_data3.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGtk::TreeIter)).zero?
    end

    def stamp : Int32
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def stamp=(value : Int32)
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def user_data!
      self.user_data.not_nil!
    end

    def user_data : Pointer(Void)?
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def user_data=(value : Pointer(Void)?)
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def user_data2!
      self.user_data2.not_nil!
    end

    def user_data2 : Pointer(Void)?
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def user_data2=(value : Pointer(Void)?)
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def user_data3!
      self.user_data3.not_nil!
    end

    def user_data3 : Pointer(Void)?
      _var = (@pointer + 24).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def user_data3=(value : Pointer(Void)?)
      _var = (@pointer + 24).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_iter_get_type
    end

    def copy : Gtk::TreeIter
      # gtk_tree_iter_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_iter_copy(self)

      # Return value handling

      Gtk::TreeIter.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # gtk_tree_iter_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_iter_free(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
