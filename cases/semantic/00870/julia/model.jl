#= 
    This code was generated by heta-compiler of v0.5.8
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    Kf1 = 1.0
    C = 1.0
    A4 = 1.0 / C
    Kr1 = 2.0
    A2 = 3.0 / C
    fasterReaction = (Kf1 * A4 + -Kr1 * A2) * C
    Kf = 1.0
    A1 = 2.0 / C
    Kr = 2.0
    A3 = 4.0 / C
    slowerReaction1 = (Kf * A1 * A2 + -Kr * A3) * C
    
    # save results

    return (
        [
            A1 * C,
            A2 * C,
            A3 * C,
            A4 * C,
        ],
        
        [
            C,
            Kr1,
            Kf1,
            Kf,
            Kr,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,Kr1,Kf1,Kf,Kr,) = p.static
    (A1_,A2_,A3_,A4_,) = u 

    # Heta rules
    A4 = A4_ / C
    A2 = A2_ / C
    fasterReaction = (Kf1 * A4 + -Kr1 * A2) * C
    A1 = A1_ / C
    A3 = A3_ / C
    slowerReaction1 = (Kf * A1 * A2 + -Kr * A3) * C
    
    #p.static .= [C,Kr1,Kf1,Kf,Kr,]
    du .= [
      -slowerReaction1,  # dA1_/dt
      fasterReaction-slowerReaction1,  # dA2_/dt
      slowerReaction1,  # dA3_/dt
      -fasterReaction,  # dA4_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,Kr1,Kf1,Kf,Kr,) = integrator.p.static
        (A1_,A2_,A3_,A4_,) = u

        # Heta rules
        A4 = A4_ / C
        A2 = A2_ / C
        fasterReaction = (Kf1 * A4 + -Kr1 * A2) * C
        A1 = A1_ / C
        A3 = A3_ / C
        slowerReaction1 = (Kf * A1 * A2 + -Kr * A3) * C
        
        # calculate amounts
        C_ = C
        fasterReaction_ = fasterReaction
        slowerReaction1_ = slowerReaction1
        Kr1_ = Kr1
        Kf1_ = Kf1
        Kf_ = Kf
        Kr_ = Kr

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events


### continous events


### event assignments


### OUTPUT ###

x00870 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00870 = x00870
)
tasks = ()

export models, tasks

end
