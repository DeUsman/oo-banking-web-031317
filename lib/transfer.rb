class Transfer
attr_reader :sender, :receiver, :amount
attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    sender.balance -= amount
    @receiver = receiver
    receiver.balance += amount
    @amount = amount
    @status = "pending"
  end

  def valid?
   self.sender.valid? && self.receiver.valid? == true
  end

  def execute_transaction
    if (!self.valid?)
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
    self.status = "complete"
  end
end

  def reverse_transfer
    self.sender.balance += self.amount
    self.receiver.balance -= self.amount
    return self.status = "reversed"
  end
end
