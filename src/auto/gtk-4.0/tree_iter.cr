module Gtk
  # The `GtkTreeIter` is the primary structure
  # for accessing a `GtkTreeModel`. Models are expected to put a unique
  # integer in the @stamp member, and put
  # model-specific data in the three @user_data
  # members.
  class TreeIter
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::TreeIter))
      @pointer.copy_from(pointer, sizeof(LibGtk::TreeIter))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(stamp : Int32? = nil, user_data : Pointer(Nil)? = nil, user_data2 : Pointer(Nil)? = nil, user_data3 : Pointer(Nil)? = nil)
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

    def stamp : Int32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def stamp=(value : Int32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def user_data : Pointer(Nil)
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      Pointer(Void)
    end

    def user_data=(value : Pointer(Nil))
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value
      value
    end

    def user_data2 : Pointer(Nil)
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      Pointer(Void)
    end

    def user_data2=(value : Pointer(Nil))
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value
      value
    end

    def user_data3 : Pointer(Nil)
      # Property getter
      _var = (@pointer + 24).as(Pointer(Pointer(Void)))
      Pointer(Void)
    end

    def user_data3=(value : Pointer(Nil))
      # Property setter
      _var = (@pointer + 24).as(Pointer(Pointer(Void))).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_iter_get_type
    end

    def copy : Gtk::TreeIter
      # gtk_tree_iter_copy: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_iter_copy(self)
      Gtk::TreeIter.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # gtk_tree_iter_free: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_iter_free(self)
    end

    def to_unsafe
      @pointer
    end
  end
end
