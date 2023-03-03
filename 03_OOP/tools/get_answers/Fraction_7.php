<?php
class Fraction
{
	private $numberator;
	private $denominator;

	public function __construct($numberator, $denominator)
	{			
		try
		{
			$this->numberator = (int)($numberator);
			$this->denominator = (int)($denominator);
			if(!is_numeric($numberator) or (!is_numeric($denominator))){
				throw new Exception("Введённые значения должны быть числами", 1);	
			}
			if($denominator == 0){
				throw new Exception("Знаменатель не равен 0", 1);
			}
			if($numberator == 0){
				$this -> numberator = 0;
				$this -> denominator = 1;					
			}
			if ($numberator < 0 and $denominator < 0){
				$this -> numberator = -$numberator;
				$this -> denominator = -$denominator;					
			}
			elseif ($numberator > 0 and $denominator < 0){
				$this -> numberator = -$numberator;
				$this -> denominator = -$denominator;	
			}
			else{
				$this -> numberator = $numberator;
				$this -> denominator = $denominator;						
			}
		}
		catch (Exception $e){
			echo $e->getMessage();
			die();
		}

		$n = $this -> numberator < 0 ? -$this -> numberator : $this -> numberator;
		$m = $this -> denominator < 0 ? -$this -> denominator : $this -> denominator;

		while($m!=$n){
			if($m>$n){
				$m-=$n;
			}
			else{
				$n-=$m;
			}
		}
		$this -> numberator /= $m;
		$this -> denominator /= $m;
	}

	public function getNumberator()
	{
		return $this->numberator;
	}

	public function getDenominator()
	{
		return $this->denominator;
	}

	public function add($frac)
	{	
		$numberator = $this -> numberator * $frac -> getDenominator() + $this -> denominator * $frac -> getNumberator();
		$denominator = $this -> denominator * $frac -> getDenominator();
		return new Fraction($numberator, $denominator);
	}

	public function sub($frac)
	{	
		$numberator = $this -> numberator * $frac -> getDenominator() - $this -> denominator * $frac -> getNumberator();
		$denominator = $this -> denominator * $frac -> getDenominator();
		return new Fraction($numberator, $denominator);
	}		

	public function multi($frac)
	{	
		$numberator = $this -> numberator *  $frac -> getNumberator();
		$denominator = $this -> denominator * $frac -> getDenominator();
		return new Fraction($numberator, $denominator);
	}

	public function div($frac)
	{	
		$numberator = $this -> numberator *  $frac -> getDenominator();
		$denominator = $this -> denominator * $frac -> getNumberator();
		return new Fraction($numberator, $denominator);
	}

	public function exp($expon)
	{	
		$numberator = pow($this -> numberator,$expon) ;
		$denominator = pow($this -> denominator,$expon);
		return new Fraction($numberator, $denominator);
	}		

	public function outputnum()
	{
		echo "Числитель: " .$this->numberator. ", Знаменатель: ".$this->denominator."<br>";
	}

	public function __toString()
	{	
		$numberator = $this -> numberator;
		$denominator = $this -> denominator;
		$int_pt = (int)($numberator / $denominator);
		if  ($int_pt == 0){					
			return $numberator. "/" .$denominator;
		}
		else{
			return $int_pt."'".abs($numberator % $denominator). "/" .abs($denominator);
		}
	}
}
