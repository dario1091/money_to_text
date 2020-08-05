#Archivo Gema_festivos_colombia/festivos_colombia.rb

require "date"

class MoneyToText
  def self.get_text(money = "1345798")
    parteEntera = money.to_i
    triUnidades = ((parteEntera % 1000))
    triMiles = ((parteEntera / 1000) % 1000)
    triMillones = ((parteEntera / 1000000) % 1000)
    triMilMillones = ((parteEntera / 1000000000) % 1000)

    response = ""
    return "Cero" if parteEntera == 0

    if triMilMillones > 0
      response << triTexto(triMilMillones) << " Mil"
    end

    if triMillones > 0
      response << triTexto(triMillones)
    end

    if triMilMillones == 0 && triMillones == 1
      response << "Millón "
    else
      response << "Millones "
    end

    if triMiles > 0
      response << triTexto(triMiles) << "Mil "
    end

    if triUnidades > 0
      response << triTexto(triUnidades)
    end
    money << " =  " << response
  end

  def self.triTexto(n)
    response = ""
    centenas = n / 100
    decenas = (n % 100) / 10
    unidades = (n % 10)

    case centenas
    when 0
    when 1
      if decenas == 0 && unidades == 0
        return "cien "
      else
        response << "Ciento "
      end
    when 2
      response << "doscientos "
    when 3
      response << "trescientos "
    when 4
      response << "cuatrocientos "
    when 5
      response << "quinientos "
    when 6
      response << "seiscientos "
    when 7
      response << "setecientos "
    when 8
      response << "ochocientos "
    when 9
      response << "novecientos "
    end

    case decenas
    when 0
    when 1
      return response << "diez " if unidades.zero?
      return response << "once " if unidades == 1
      return response << "doce " if unidades == 2
      return response << "trece " if unidades == 3
      return response << "catorce " if unidades == 4
      return response << "quince " if unidades == 5
      return response << "Dieci"
    when 2
      unidades == 0 ? response << "veinte " : response << "veinti"
      return response
    when 3
      response << "treinta "
    when 4
      response << "cuarenta "
    when 5
      response << "cincuenta "
    when 6
      response << "sesenta "
    when 7
      response << "setenta "
    when 8
      response << "ochenta "
    when 9
      response << "noventa "
    end

    if decenas > 2 && unidades > 0
      response << "y "
    end

    case unidades
    when 0
    when 1
      response << "un "
    when 2
      response << "dos "
    when 3
      response << "tres "
    when 4
      response << "cuatro "
    when 5
      response << "cinco "
    when 6
      response << "seis "
    when 7
      response << "siete "
    when 8
      response << "ocho "
    when 9
      response << "nueve "
    end
    return response
  end

  puts get_text()
end
