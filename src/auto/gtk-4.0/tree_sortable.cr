module Gtk
  # The interface for sortable models used by GtkTreeView
  #
  # `GtkTreeSortable` is an interface to be implemented by tree models which
  # support sorting. The `GtkTreeView` uses the methods provided by this interface
  # to sort the model.
  module TreeSortable
    def sort_column_id(sort_column_id : Int32, order : Gtk::SortType) : Bool
      # gtk_tree_sortable_get_sort_column_id: (Method)
      # @sort_column_id: (out) (transfer full)
      # @order: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_sortable_get_sort_column_id(@pointer, sort_column_id, order)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def has_default_sort_func : Bool
      # gtk_tree_sortable_has_default_sort_func: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_sortable_has_default_sort_func(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def default_sort_func=(sort_func : Gtk::TreeIterCompareFunc) : Nil
      # gtk_tree_sortable_set_default_sort_func: (Method)
      # @user_data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if sort_func
        _box = ::Box.box(sort_func)
        sort_func = ->(lib_model : Pointer(Void), lib_a : Pointer(Void), lib_b : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          model = Gtk::TreeModel.new(lib_model, :none)
          # Generator::BuiltInTypeArgPlan
          a = Gtk::TreeIter.new(lib_a, :none)
          # Generator::BuiltInTypeArgPlan
          b = Gtk::TreeIter.new(lib_b, :none)
          ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Gtk::TreeIter, Int32)).unbox(lib_user_data).call(model, a, b)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        sort_func = user_data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_tree_sortable_set_default_sort_func(@pointer, sort_func, user_data, destroy)

      # Return value handling
    end

    def set_sort_column_id(sort_column_id : Int32, order : Gtk::SortType) : Nil
      # gtk_tree_sortable_set_sort_column_id: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_sortable_set_sort_column_id(@pointer, sort_column_id, order)

      # Return value handling
    end

    def set_sort_func(sort_column_id : Int32, sort_func : Gtk::TreeIterCompareFunc) : Nil
      # gtk_tree_sortable_set_sort_func: (Method)
      # @user_data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if sort_func
        _box = ::Box.box(sort_func)
        sort_func = ->(lib_model : Pointer(Void), lib_a : Pointer(Void), lib_b : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          model = Gtk::TreeModel.new(lib_model, :none)
          # Generator::BuiltInTypeArgPlan
          a = Gtk::TreeIter.new(lib_a, :none)
          # Generator::BuiltInTypeArgPlan
          b = Gtk::TreeIter.new(lib_b, :none)
          ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Gtk::TreeIter, Int32)).unbox(lib_user_data).call(model, a, b)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        sort_func = user_data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_tree_sortable_set_sort_func(@pointer, sort_column_id, sort_func, user_data, destroy)

      # Return value handling
    end

    def sort_column_changed : Nil
      # gtk_tree_sortable_sort_column_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_sortable_sort_column_changed(@pointer)

      # Return value handling
    end

    struct SortColumnChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "sort-column-changed::#{@detail}" : "sort-column-changed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TreeSortable, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractTreeSortable.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeSortable, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeSortable, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractTreeSortable.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeSortable, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "sort-column-changed")
      end
    end

    def sort_column_changed_signal
      SortColumnChangedSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractTreeSortable < GObject::Object
    include TreeSortable

    GICrystal.define_new_method(Gtk::AbstractTreeSortable, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_sortable_get_type
    end

    # Cast a `GObject::Object` to `TreeSortable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to TreeSortable")
    end

    # Cast a `GObject::Object` to `TreeSortable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
