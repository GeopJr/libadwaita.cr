require "../g_object-2.0/object"

module Gtk
  # `GtkSorter` is an object to describe sorting criteria.
  #
  # Its primary user is `Gtk#SortListModel`
  #
  # The model will use a sorter to determine the order in which
  # its items should appear by calling `Gtk::Sorter#compare`
  # for pairs of items.
  #
  # Sorters may change their sorting behavior through their lifetime.
  # In that case, they will emit the `Gtk::Sorter::#changed` signal
  # to notify that the sort order is no longer valid and should be updated
  # by calling gtk_sorter_compare() again.
  #
  # GTK provides various pre-made sorter implementations for common sorting
  # operations. `Gtk#ColumnView` has built-in support for sorting lists
  # via the `Gtk::ColumnViewColumn#sorter` property, where the user can
  # change the sorting by clicking on list headers.
  #
  # Of course, in particular for large lists, it is also possible to subclass
  # `GtkSorter` and provide one's own sorter.
  @[GObject::GeneratedWrapper]
  class Sorter < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::SorterClass), class_init,
        sizeof(LibGtk::Sorter), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_sorter_get_type
    end

    # Notifies all users of the sorter that it has changed.
    #
    # This emits the `Gtk::Sorter::#changed` signal. Users
    # of the sorter should then update the sort order via
    # `Gtk::Sorter#compare`.
    #
    # Depending on the @change parameter, it may be possible to
    # update the sort order without a full resorting. Refer to
    # the `Gtk#SorterChange` documentation for details.
    #
    # This function is intended for implementors of `GtkSorter`
    # subclasses and should not be called from other functions.
    def changed(change : Gtk::SorterChange) : Nil
      # gtk_sorter_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_sorter_changed(self, change)

      # Return value handling
    end

    # Compares two given items according to the sort order implemented
    # by the sorter.
    #
    # Sorters implement a partial order:
    #
    # * It is reflexive, ie a = a
    # * It is antisymmetric, ie if a < b and b < a, then a = b
    # * It is transitive, ie given any 3 items with a ≤ b and b ≤ c,
    #   then a ≤ c
    #
    # The sorter may signal it conforms to additional constraints
    # via the return value of `Gtk::Sorter#order`.
    def compare(item1 : GObject::Object, item2 : GObject::Object) : Gtk::Ordering
      # gtk_sorter_compare: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_sorter_compare(self, item1, item2)

      # Return value handling

      Gtk::Ordering.new(_retval)
    end

    # Gets the order that @self conforms to.
    #
    # See `Gtk#SorterOrder` for details
    # of the possible return values.
    #
    # This function is intended to allow optimizations.
    def order : Gtk::SorterOrder
      # gtk_sorter_get_order: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_sorter_get_order(self)

      # Return value handling

      Gtk::SorterOrder.new(_retval)
    end

    # Emitted whenever the sorter changed.
    #
    # Users of the sorter should then update the sort order
    # again via gtk_sorter_compare().
    #
    # `Gtk#SortListModel` handles this signal automatically.
    #
    # Depending on the @change parameter, it may be possible to update
    # the sort order without a full resorting. Refer to the
    # `Gtk#SorterChange` documentation for details.
    struct ChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(&block : Proc(Gtk::SorterChange, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::SorterChange, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::SorterChange, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::SorterChange.new(lib_arg0)
          ::Box(Proc(Gtk::SorterChange, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::SorterChange, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::SorterChange.new(lib_arg0)
          ::Box(Proc(Gtk::SorterChange, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Sorter, Gtk::SorterChange, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Sorter.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::SorterChange.new(lib_arg0)
          ::Box(Proc(Gtk::Sorter, Gtk::SorterChange, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Sorter, Gtk::SorterChange, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Sorter.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::SorterChange.new(lib_arg0)
          ::Box(Proc(Gtk::Sorter, Gtk::SorterChange, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(change : Gtk::SorterChange) : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed", change)
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end
  end
end
